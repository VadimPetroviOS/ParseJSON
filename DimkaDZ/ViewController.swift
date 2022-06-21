//
//  ViewController.swift
//  DimkaDZ
//
//  Created by Вадим on 16.05.2022.
//

import UIKit

final class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Уровни доступа public -> private
    private let tableViews = UITableView()  //зачем тогда писать self, если это уже экземпляр класса
    private let dataLoader: DataLoader
    private var data: [Model]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViews.dataSource = self
        self.tableViews.delegate = self
        self.tableViews.register(UITableViewCell.self,
                            forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableViews)
    }
    
    override func viewDidLayoutSubviews() { // - поосле появления view
        super.viewDidLayoutSubviews()
        self.tableViews.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let items = data[indexPath.row].body
        let vc = SecondViewController(relatedItems: items)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    init(dataLoader: DataLoader) {
        
        self.dataLoader = dataLoader
        self.data = self.dataLoader.userData
        super.init(nibName: nil, bundle: nil)  // nibName, bundle что они делают?
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





























// MARK: popitka1
/*
 
 let urlString = "/Users/fastlee/Desktop/VadimProduct/learnProjects/DimkaDZ/comments.json"
 // Создаем константу в которую записываем путь до файла
 guard let url = URL(string: urlString) else { return }
 // Используем флоу гуард, для чего?
 // Создаем константу url, в которую записываем из стурктуры URL
 // URL это структура, внутри структуры есть инициалтзатор строки()
 // Вопрос для чего нужна?
 
 // URL нужна чтобы считать адрес
 // string чтобы считать адрес записанный в строку
 // guard нужен для проверки есть этот файл или нет
 // константа url имеет внутри доступ к файлу
 
 URLSession.shared.dataTask(with: url) { data, responce, error in
     if let error = error {
         print(error)
         return
     }
     
     guard let data = data else { return }
     
     let jsonString = String(data: data, encoding: .utf8)
     //print(jsonString)
     
     do {
         let decoder = JSONDecoder()
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
         decoder.dateDecodingStrategy = .formatted(dateFormatter)
         let lessons = try decoder.decode([Lesson].self, from: data)
         print(lessons.first?.id)
     } catch {
         print(error)
     }
     
     
     
 }.resume()
 
 */

// MARK: popitka2
/*
 
 import UIKit

 class ViewController: UIViewController {

     let sessionConfiguration = URLSessionConfiguration.default
     
     // URLSessionConfiguration - открыаает сетевую сессию и позволяет работать с ней.
             //сессия - это временной промежуток какой-либо деятельности.
     
     // default - стандартная настройка сессия(болванка) по умолчанию.
     
     let session = URLSession.shared
     
     // класс URLSession нужен для загрузки данных и их отправки
     
     // shared - общий одноэлементный объект сессии.
     
     let decoder = JSONDecoder()
     
     //JSONDecoder -  это класс который, декодирует данные из JSON
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
         obtainPosts()
         
     }
     
     func obtainPosts() {
         
         guard let url = URL(string:
             "/Users/fastlee/Desktop/VadimProduct/learnProjects/DimkaDZ/comments.json") else {
              return
          }
         
         //  URL - это структура, предоставляет доступ к файлу находящемуся на локальном сервере или на жестком диске
         
         // guard здесь применятеся для проверки объекта url на валидность
             // валидность - проверка на годноту(есть там что внутри или нет)
         
         session.dataTask(with: url) { [weak self](data, response, error) in
             
             if error == nil, let parsData = data {
                 guard let strongSelf = self else { return }
                 let posts = try? strongSelf.decoder.decode([Lesson].self, from: parsData)
                 
                 print("Posts: \(posts)")
                 
             } else {
                 print("Error: \(error?.localizedDescription) ")
             }
             
             
             
         }.resume()
         
         //dataTask - это метод который извлекает содержимое url
             // data - это данные
         
             // responce - это ответ на наш запрос который приходит к нам вместе с данными( там можно узнать какого типа файл нам вернулся, хедеры только зачем они нужны?)ё
         
             // error - ошибка вернется если что-то пошло не так( ощибку надо прописывать)
         
         // resume - метод который запускает задачу, а зачем ее запускать? (недавно вызванные задачи начинаются в приостановленном состоянии)
     }
 }
 
 */

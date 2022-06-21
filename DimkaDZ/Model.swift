//
//  Model.swift
//  DimkaDZ
//
//  Created by Вадим on 16.05.2022.
//

import Foundation

struct Model : Decodable{
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

// Lesson - это структура которая принимает поля внутри файла, если указать поле которое, которого нет внутри файла то он выдаст ошибку, обязательно нужно инициализировать структуру с Decodable.

// Decodable - это протокол(тип) который может декодировать себя из внешнего представления.

package com.knhlje.smartstore.dto

import java.io.Serializable

data class Product(var name: String, var type: String, var price: Int, var img: String): Serializable{

    var id: Int = 0

    constructor(id: Int, name: String, type: String, price: Int, img: String): this(name, type, price, img){
        this.id = id
    }
}

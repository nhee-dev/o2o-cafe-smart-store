package com.knhlje.smartstore.dto

import java.io.Serializable

data class ProductDetail(
    val avg: Double,
    val comment: String,
    val commentCnt: Int,
    val commentId: Int,
    val img: String,
    val name: String,
    val price: Int,
    val rating: Double,
    val sells: Int,
    val type: String,
    val userName: String,
    val user_id: String
) : Serializable
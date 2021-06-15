import { API_URL } from "../constants"
import getCategory from "./getCategory"

export default async function getProduct(id: string) {
    let { data: product } = await fetch(`${API_URL}/items/products/${id}?fields=*.*`).then(r => r.json())
    product.image = `${API_URL}/assets/${product.image.id}`
    product.thumbnail = `${API_URL}/assets/${product.image.id}?width=200&height=200&fit=inside`
    product.secondary_images = product.secondary_images.map(image => `${API_URL}/assets/${image.directus_files_id}`) 
    product.categories = (await Promise.all(product.categories.map(category => getCategory(category.id)))).map((category: any) => category.name)

    return product
}
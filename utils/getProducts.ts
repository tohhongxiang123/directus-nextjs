import { API_URL } from "../constants"
import { Product } from "../types/Product"
import getCategory from "./getCategory"
import { serialize } from "."

/**
 * Gets all products from API
 * https://docs.directus.io/reference/api/query/
 * Follow the query parameters as an object
 * @params query - Query object
 * @returns Product[]
 */
export default async function getProducts<T extends { [key: string]: any }>(query = {} as T): Promise<{ data: Product[], meta: { filter_count: number } }> {    
    const allParams = {
        fields: '*,image.id,categories.categories_id,secondary_images.directus_files_id',
        meta: 'filter_count',
        ...query,
        filter: {
            hidden: { _eq: false },
            ...query.filter
        }
    }

    console.log(allParams)

    let { data, meta } = await fetch(`${API_URL}/items/products?${serialize(allParams)}`).then(r => r.json())
    data = await Promise.all(data.map(async product => ({
        ...product,
        image: `${API_URL}/assets/${product.image.id}`,
        thumbnail: `${API_URL}/assets/${product.image.id}?width=400&height=400&fit=inside`,
        secondary_images: product.secondary_images.map(image => `${API_URL}/assets/${image.directus_files_id}?width=400&height=400&fit=inside`),
        categories: (await Promise.all(product.categories.map(category => getCategory(category.categories_id)))),
        custom_fields: product.custom_fields ?? [],
        seo: product.seo && product.seo[0] ? product.seo[0] : {}
    })))

    return { data, meta }
}

// get all products who has includes categories_id = 4
// http://localhost:8055/items/products?filter[categories][categories_id][_in]=4
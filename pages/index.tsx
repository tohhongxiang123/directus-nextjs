import React from "react";
import { GetStaticPropsContext } from 'next';
import { getProducts } from '../utils';
import { ProductPreview, Layout } from '../components';
import Link from 'next/link'

export default function Page({ products = [] }) {
    return (
        <Layout seoTags={{
            "og:description": "E-commerce store built with NextJS, TailwindCSS, Directus and Snipcart",
            "og:title": process.env.NEXT_PUBLIC_STOREFRONT_NAME,
            "og:image": "/images/hero-banner.jpg",
            "og:type": "website",
            "og:url": process.env.NEXT_PUBLIC_STOREFRONT_URL
        }}>
            <section className="flex flex-col justify-center items-center px-4 py-32 text-gray-100" style={{ background: `linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('/images/hero-banner.jpg')`, backgroundPosition: 'center' }}>
                <h1 className="font-bold text-3xl mb-4">Lorem Ipsum</h1>
                <p className="font-light opacity-80 tracking-wide max-w-2xl text-center mb-8">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatem sint obcaecati dolores in sapiente odio impedit vero nemo? Perferendis odit tempora cum voluptatibus, molestias ipsam exercitationem illum perspiciatis. Accusamus, quod.</p>
                <Link href="/products"><button className="bg-primary-500 hover:bg-primary-700 text-white font-bold py-2 px-4 rounded">See our Products</button></Link>
            </section>
            <section className="flex flex-col justify-center items-center px-4 py-16">
                <Link href="/products?featured=true"><h2 className="font-bold text-3xl mb-4 hover:underline cursor-pointer text-center"><a>Featured Products</a></h2></Link>
                <div className="flex flex-wrap gap-12 justify-center items-start py-12">
                    {products.length > 0 ? products.map(product => (
                        <ProductPreview product={product} key={product.id} />
                    )) : <p className="text-lg font-semibold opacity-60"><i>No products found</i></p>}
                </div>
            </section>
        </Layout>
    )
}

export async function getStaticProps(context: GetStaticPropsContext) {
    const { data: products } = await getProducts({ filter: { featured: { _eq: true } } })

    return {
        props: {
            products: products.slice(0, 3)
        },
        revalidate: 60
    }
}
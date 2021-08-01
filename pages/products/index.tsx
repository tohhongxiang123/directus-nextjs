import { GetServerSidePropsContext } from 'next'
import { useRouter } from 'next/router'
import React, { useRef } from 'react'
import { useState, useEffect } from 'react'
import Footer from '../../components/Footer'
import Layout from '../../components/Layout'
import ProductPreview from '../../components/ProductPreview'
import { useOnClickOutside } from '../../hooks'
import { getCategories, getProducts } from '../../utils'
import { Category, Product } from '../../types'
import Pagination from '../../components/Pagination'
import Link from 'next/link'

interface PageProps {
    products: Product[],
    categories: Category[],
    totalCount: number
}

const DEFAULT_LIMIT = 100
const DEFAULT_PAGE = 1

export default function index({ products = [], categories = [], totalCount }: PageProps) {
    const router = useRouter()

    // search query
    const [search, setSearch] = useState('')
    const handleTextSearch = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        router.push({ pathname: '/products', query: { ...router.query, search } })
        setIsFiltersMenuOpen(false)
    }
    const handleClearText = () => {
        setSearch('')
        const { search, ...newQueryObject } = router.query

        router.push({ pathname: '/products', query: newQueryObject })
        setIsFiltersMenuOpen(false)
    }
    useEffect(() => {
        const searchQuery = router.query.search as string
        if (searchQuery) {
            setSearch(searchQuery)
        }
    }, [router.query])

    // show featured only
    const [showFeaturedOnly, setShowFeaturedOnly] = useState(false)
    const handleShowFeaturedOnly = (e: React.FormEvent<HTMLFormElement>) => {
        e.preventDefault()
        let shouldShowFeatured = !showFeaturedOnly
        setShowFeaturedOnly(shouldShowFeatured)

        if (shouldShowFeatured) {
            router.push({ pathname: '/products', query: { ...router.query, featured: shouldShowFeatured } })
        } else {
            const { featured, ...newQueryObject } = router.query;
            router.push({ pathname: '/products', query: newQueryObject })
        }
        setIsFiltersMenuOpen(false)
    }
    useEffect(() => {
        const showFeaturedOnly = router.query.featured as string
        if (showFeaturedOnly) {
            setShowFeaturedOnly(showFeaturedOnly == "true" ? true : false)
        }
    }, [router.query])

    // category query
    const [categoriesSearch, setCategoriesSearch] = useState(Object.fromEntries(categories.map(category => [category.id, false])))
    const handleCategorySearch = (e?: React.FormEvent<HTMLFormElement>) => {
        e && e.preventDefault()

        // get all categoryIDs marked true into an array
        const categories = Object.keys(categoriesSearch).filter(categoryId => categoriesSearch[categoryId])
        router.push({ pathname: '/products', query: { ...router.query, categories } })
        setIsFiltersMenuOpen(false)
    }
    const handleClearCategories = () => {
        // sets all values in categoriesSearch to false
        setCategoriesSearch(previousCategoriesSearch => Object.fromEntries(Object.keys(previousCategoriesSearch).map(category => [category, false])))
        const { categories, ...newQueryObject } = router.query
        router.push({ pathname: '/products', query: newQueryObject })
        setIsFiltersMenuOpen(false)
    }
    useEffect(() => {
        const markedCategories = router.query.categories as string[]

        if (markedCategories) {
            setCategoriesSearch(previousCategoriesSearch => {
                const result = { ...previousCategoriesSearch }
                Object.keys(previousCategoriesSearch).forEach((category) => {
                    result[category] = markedCategories.includes(category)
                })
                return result
            })
        }
    }, [router.query])

    // sort query
    const [sortOption, setSortOption] = useState("")
    const handleSort = (e: React.ChangeEvent<HTMLSelectElement>) => {
        const selectedSortOption = e.target.value
        setSortOption(selectedSortOption)

        if (selectedSortOption) {
            router.push({ pathname: '/products', query: { ...router.query, sort: selectedSortOption } })
        } else {
            const { sort, ...query } = router.query
            router.push({ pathname: '/products', query })
        }

        setIsFiltersMenuOpen(false)
    }
    useEffect(() => {
        const selectedSortOption = (router.query.sort ?? "") as string
        setSortOption(selectedSortOption)
    }, [router.query])

    // clear all filters from query
    const handleClearAll = () => {
        setCategoriesSearch(previousCategoriesSearch => Object.fromEntries(Object.keys(previousCategoriesSearch).map(category => [category, false])))
        setSearch('')
        setIsFiltersMenuOpen(false)
        setShowFeaturedOnly(false)
        router.push({ pathname: '/products' })
    }

    // apply all filters
    const handleSearchAll = () => {
        const categories = Object.keys(categoriesSearch).filter(categoryId => categoriesSearch[categoryId])
        router.push({ pathname: '/products', query: { ...router.query, search, categories } })
    }

    // handles filter menu open/close
    const [isFiltersMenuOpen, setIsFiltersMenuOpen] = useState(false)
    const filtersMenuRef = useRef<HTMLDivElement>(null)
    // useOnClickOutside(filtersMenuRef, () => setIsFiltersMenuOpen(false))

    // scroll to top of page if query changes
    const topOfPageRef = useRef(null)
    useEffect(() => {
        if (topOfPageRef.current) {
            topOfPageRef.current.scrollIntoView()
        }
    }, [router.query])

    const currentPage = parseInt(router.query.page as string ?? DEFAULT_PAGE.toString())
    const limit = parseInt(router.query.limit as string ?? DEFAULT_LIMIT.toString())
    const areFiltersActive = JSON.stringify(router.query) !== "{}"
    return (
        <Layout title="Products" enableFooter={false}>
            <div className="flex h-full relative">
                <div className={`absolute xl:relative min-h-full flex justify-start ${isFiltersMenuOpen ? 'w-full xl:w-auto z-10' : 'bg-opacity-0'} bg-black bg-opacity-80`} aria-expanded={isFiltersMenuOpen} role="menu" id="filtersMenu" aria-labelledby="filtersMenuButton">
                    <div ref={filtersMenuRef} className="relative h-full bg-primary-50 border-r border-gray-200">
                        <div className={`${isFiltersMenuOpen ? 'block' : 'hidden'} xl:block flex flex-col items-stretch justify-center gap-8`}>
                            <button className="xl:hidden px-4 py-2 rounded absolute top-0 right-0 text-xl font-bold hover:bg-primary-200" onClick={() => setIsFiltersMenuOpen(false)}>×</button>
                            <form role="menuitem" className={`px-4 pt-4 mt-4`} onSubmit={handleTextSearch}>
                                <div>
                                    <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="search">
                                        Search
                                    </label>
                                    <div className="flex flex-row">
                                        <div className="relative flex flex-row items-center justify-center">
                                            <input value={search} onChange={e => setSearch(e.target.value)} className="appearance-none border rounded-l w-full py-2 px-3 text-gray-700 leading-tight focus:shadow-outline" id="search" type="text" placeholder="Search" />
                                            {search.length > 0 && <button className="z-10 h-full text-center absolute right-0 pr-4 opacity-70 hover:opacity:100 font-bold" type="button" onClick={handleClearText}>
                                                ×
                                            </button>}
                                        </div>
                                        <button className="bg-primary-500 hover:bg-primary-700 text-white font-bold p-2 rounded-r focus:shadow-outline" type="submit">
                                            <img src="/icons/search.svg" alt="search" />
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <form role="menuitem" className="px-4 pt-4" onSubmit={handleShowFeaturedOnly}>
                                <div>
                                    <small className="block text-gray-700 text-sm font-bold mb-2">
                                        Featured Items
                                    </small>
                                    <div className="flex flex-col mb-4">
                                        <div className="flex flex-col items-center justify-center gap-y-2">
                                            <button className="bg-primary-500 hover:bg-primary-700 text-white font-bold py-2 px-4 rounded focus:shadow-outline" type="submit">
                                                {showFeaturedOnly ? "Hide" : "Show"} Featured Items
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <form role="menuitem" className="px-4 pt-4" onSubmit={handleCategorySearch}>
                                <div>
                                    <small className="block text-gray-700 text-sm font-bold mb-2">
                                        Categories
                                    </small>
                                    <div className="flex flex-col mb-4">
                                        {categories.map(category => (
                                            <div key={category.id}>
                                                <label className="inline-flex items-center">
                                                    <input type="checkbox" className="form-checkbox" checked={categoriesSearch[category.id]} onChange={e => setCategoriesSearch(c => ({ ...c, [category.id]: !c[category.id] }))} />
                                                    <span className="ml-2">{category.name}</span>
                                                </label>
                                            </div>
                                        ))}
                                        <div className="mt-4 flex flex-col items-center justify-center gap-y-2">
                                            <button className="bg-primary-500 hover:bg-primary-700 text-white font-bold py-2 px-4 rounded focus:shadow-outline" type="submit">
                                                Filter by categories
                                            </button>
                                            <button className="font-medium hover:underline opacity-70" onClick={handleClearCategories}>Clear categories</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                            <div role="menuitem" className="px-4 pt-4">
                                <label className="block text-gray-700 text-sm font-bold mb-2" htmlFor="sort">
                                    Sort
                                </label>
                                <select value={sortOption} onChange={handleSort} className="appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:shadow-outline" id="sort">
                                    <option value="">No sort</option>
                                    <option value="price">Price (Ascending)</option>
                                    <option value="-price">Price (Descending)</option>
                                    <option value="name">Alphabetical (Ascending)</option>
                                    <option value="-name">Alphabetical (Descending)</option>
                                </select>
                            </div>
                            <div role="menuitem" className="mt-4 px-8 pt-6 pb-8 mb-4 flex flex-col items-center justify-center gap-y-2">
                                <button onClick={handleSearchAll} className="bg-primary-500 hover:bg-primary-700 text-white font-bold py-2 px-4 rounded focus:shadow-outline" type="submit">
                                    Apply all filters
                                </button>
                                <button onClick={handleClearAll} className="font-medium hover:underline opacity-70">Clear all filters</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="overflow-y-auto overflow-x-hidden w-full">
                    <div className="py-8 px-4" ref={topOfPageRef}>
                        <div className="flex flex-col items-baseline gap-x-8 mb-12">
                            <h1 className="font-bold text-2xl mb-4">All Products</h1>
                            <div className="flex justify-start w-full gap-4">
                                <button id="filtersMenuButton" className={`rounded-md bg-gray-100 hover:bg-gray-200 font-semibold px-4 py-2 ${isFiltersMenuOpen ? 'hidden' : 'block'} xl:hidden`} onClick={() => setIsFiltersMenuOpen(true)} aria-haspopup={true} aria-controls="filtersMenu">Filters & Search</button>
                                {areFiltersActive && <button onClick={handleClearAll} className="font-semibold text-gray-600 rounded-md px-4 py-2 hover:text-gray-900 hover:underline">Clear filters</button>}
                            </div>
                        </div>
                        {products.length > 0 ? (
                            <div className="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-12">
                                {products.map(product => <ProductPreview key={product.id} product={product} />)}
                            </div>
                        ) : <p className="text-center font-bold text-2xl text-gray-600">No products found...</p>}
                        <div className="flex justify-end">
                            <Pagination currentPage={currentPage} totalCount={totalCount} pageLimit={limit} />
                        </div>
                    </div>
                    <Footer />
                </div>
            </div>
        </Layout>
    )
}

export async function getServerSideProps(context: GetServerSidePropsContext) {
    const { search: textSearch, categories: categoriesSearch, featured, page, limit, ...params }: any = context.query

    // set up default query params for product search
    params.page = page ? page : DEFAULT_PAGE
    params.limit = limit ? limit : DEFAULT_LIMIT
    params.filter = {}

    if (textSearch) {
        params.search = textSearch // search by text
    }

    if (categoriesSearch) {
        params.filter = { ...params.filter, categories: { categories_id: { _in: categoriesSearch } } } // match at least 1 category
    }

    if (featured) {
        params.filter = { ...params.filter, featured: { _eq: true } } // must be featured
    }

    const { data: products, meta: { filter_count } } = await getProducts(params)
    const { data: categories } = await getCategories({ filter: { products: { id: { _nnull: true } } } }) // get all categories with at least 1 product

    return {
        props: {
            products,
            categories,
            totalCount: filter_count
        }
    }
}
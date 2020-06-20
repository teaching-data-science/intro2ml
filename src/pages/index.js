import React from 'react'
import { graphql } from 'gatsby'

import Layout from '../components/layout'
import { Link } from '../components/link'
import Logo from '../../static/logo.svg'

import classes from '../styles/index.module.sass'

export default ({ data }) => {
    const siteMetadata = data.site.siteMetadata
    const chapters = data.allMarkdownRemark.edges.map(({ node }) => ({
        slug: node.fields.slug,
        title: node.frontmatter.title,
        description: node.frontmatter.description,
    }))
    return (
        <Layout isHome>
            <Logo className={classes.logo} aria-label={siteMetadata.title} />
            <section>
                <h1 className={classes.subtitle}>Introduction to Machine Learning (I2ML)</h1>
                <div className={classes.introduction}>
                <p>
                    This course offers an introductory and applied overview of <strong>supervised</strong> Machine Learning. This includes:
                </p>
                <p>
                    <ul>
                        <li>ML Basics</li>
                        <li>Supervised Regression</li>
                        <li>Supervised Classification</li>
                        <li>Performance Evaluation</li>
                        <li>Classification and Regression Trees</li>
                        <li>Random Forests</li>
                        <li>Parameter Tuning</li>
                        <li>Practical Advice</li>
                    </ul>
                </p>
                <p>
                    The course is of an introductory nature and geared towards students with some statistics background. It is aimed at a practical and operational understanding of the covered algorithms and models, with less emphasis on theory and formalism. The accompanying exercises, demos and tutorials are a mix of theoretical and p ractical assignments, the latter in R (mostly with <strong>mlr3</strong>).
                </p>
                </div>
            </section>
            {chapters.map(({ slug, title, description }) => (
                <section key={slug} className={classes.chapter}>
                    <h2 className={classes.chapterTitle}>
                        <Link hidden to={slug}>
                            {title}
                        </Link>
                    </h2>
                    <p className={classes.chapterDesc}>
                        <Link hidden to={slug}>
                            {description}
                        </Link>
                    </p>
                </section>
            ))}
        </Layout>
    )
}

export const pageQuery = graphql`
    {
        site {
            siteMetadata {
                title
            }
        }
        allMarkdownRemark(
            sort: { fields: [frontmatter___title], order: ASC }
            filter: { frontmatter: { type: { eq: "chapter" } } }
        ) {
            edges {
                node {
                    fields {
                        slug
                    }
                    frontmatter {
                        title
                        description
                    }
                }
            }
        }
    }
`
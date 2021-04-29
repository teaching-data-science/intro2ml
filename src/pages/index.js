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
             This website offers an open and free introductory course on (supervised) machine learning. The course is constructed holistically and as self-contained as possible, in order to cover most relevant areas of supervised ML. While the introductory parts are more aimed at a practical and operational understanding of the covered algorithms and models, we also include sound theoretical foundations and proofs in more advanced sections in order to teach ML theory as self-contained and precise as possible.
                </p>
                <p>
                It can either be taken as an introductory undergraduate course early on - if you skip the more advanced sections - or as an introductory graduate-level course for Master's level students.
                </p>
                <p>
                One general, important goal of the course - on top of clearly explaining the most popular ML algorithms - is to clearly demonstrate the fundamental building block behind ML, instead of introducing "yet another algorithm, with yet another differently named concept". We discuss, compare and contrast risk minimization, statistical parameter estimation, the Bayesian viewpoint and information theory and demonstrate that all of these are equally valid entry points to ML - which often (confusingly) talk about the same thing with different terminology. Being able to understand these similarities and enabling to mentally switch perspectives when needed is a major goal of this course.
                </p>
                <p>If you want to learn more about this course, please
                <ul> xxx
                    <li>read the outline further below</li>
                    <li>read the section on prerequisites </li>
                </ul>
                </p>
                <p>Later on, please note:
                <ul>
                    <tab indent=20> <li>The course uses a unified mathematical notation. We provide cheat sheets to summarize the most important symbols and concepts.</li>
                    <li>Most sections already contain quizzes, coding demos, and exercises with worked-out solutions to enable self-study as much as possible.</li>
                </ul>
                </p>
                <p>What this course does not cover - in order not have its scope grow completely out of hand:
                <BLOCKQUOTE>
                <ul>
                    <li>Neural networks and deep learning. We are currently working on a similar repo / page for that, which builds upon this course.</li>
                    <li>An in-depth coverage of optimization. We might publish a course on that at some point, but this is currently lower priority.</li>
                </ul>       
                </BLOCKQUOTE>
                </p>
                <p>While most of the course is on a conceptual, programming language-independent level - which is by design -  we offer a large variety of applied exercises in R, often using the mlr3 package and its corresponding universe. We are working on offering the exercises in python as well.
                </p>
                <p>Note: In summer semester 2021 we are still extending the material somewhat, so the complete first version including all advanced material will probably be available around 07/2021.
                </p>

                <p>
                The course material is developed in a public github repository: <a href="https://github.com/compstat-lmu/lecture_i2ml">https://github.com/compstat-lmu/lecture_i2ml</a>. You can find the changelog at: <a href="https://github.com/compstat-lmu/lecture_i2ml/blob/master/CHANGELOG.md">https://github.com/compstat-lmu/lecture_i2ml/blob/master/CHANGELOG.md</a>.
                </p>
                <p>
                If you love teaching ML and have free resources available, please consider joining the team and email us now! (bernd.bischl@stat.uni-muenchen.de or ludwig.bothmann@stat.uni-muenchen.de)
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
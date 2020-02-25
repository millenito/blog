# millenito.github.io
My personal blog/portfolio website created using [Hugo](gohugo.io) and a modified version of [Cupper](https://github.com/zwbetz-gh/cupper-hugo-theme) theme

The site is deployed using [Github Pages](https://pages.github.com), currently without a custom domain so still using [millenito.github.io](millenito.github.io) 

## Deploy
When changes are done being made to the site, the deploy process can be done using `.deploy.sh` script from the root of the site's directory

``` bash
$ ./deploy.sh
```

this script will rebuild the static content using hugo's `hugo` command and push the changes to my [other repository](gitbuh.com/millenito/millenito.github.io) which is storing the static content to be served by github pages

## TODO / Future Notes
- Make a blog search feature 
- CV / Projects section
- Change the code syntax highlighter to use a dark theme (currently using [Prism.js](https://prismjs.com))
- Make inline `code` more readable
- Custom domain maybe?
- Integrate with [Travis CI](https://travis-ci.com) to automate build and deploy process (after acquiring custom domain)
- **MAKE AN ENGLISH VERSION OF THE SITE AND TRANSLATE THE POSTS TO ENGLISH**

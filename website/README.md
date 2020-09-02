# website

This directory contain raw files (`*.Rmd`) on which the website is built. All the rendered content (HTML files) present in [docs](../docs).

Site generated using [R-Markdown's site generator](https://bookdown.org/yihui/rmarkdown/rmarkdown-site.html). The website skeleton presnt in [_site.yml](_site.yml) file.

Once editings or additions of .Rmd file are done use [update.sh](update.sh) which render all the files to **docs** directory, from where the site is live.

## Edit the site

All the edit happens to `*.Rmd` files and then [_site.yml](_site.yml) file. 

Once after editing done, Generate the site using [update.sh](update.sh), which will remove the older HTML render HTML pages into [docs](../docs) directory.

### Style Guide

The styling is optional, with some custom enhanced features.

<details>
  <summary>Click to expand!</summary>

#### Add Aim
Use `.session-start` class in a header.

Example
```
### Aim { .session-start }
```

#### Add Question and Answer
Include `class = "exercise fold s o"` in a division

Example
```
<div class = "exercise fold s o">
**Exercise-1**
Some Question

**Solution**
Some Solution/R code chunks 

</div>
```

#### Add End Key points
Use `.session-end` class in a header.

Example
```
### Key Points { .session-end }
```
</details>

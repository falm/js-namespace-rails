# JsNamespaceRails [![Build Status](https://travis-ci.org/falm/js-namespace-rails.svg?branch=master)](https://travis-ci.org/falm/js-namespace-rails) [![Coverage Status](https://coveralls.io/repos/github/falm/js-namespace-rails/badge.svg?branch=master)](https://coveralls.io/github/falm/js-namespace-rails?branch=master) [![Code Climate](https://codeclimate.com/github/falm/js-namespace-rails/badges/gpa.svg)](https://codeclimate.com/github/falm/js-namespace-rails) [![Dependency Status](https://gemnasium.com/badges/github.com/falm/js-namespace-rails.svg)](https://gemnasium.com/github.com/falm/js-namespace-rails) [![Gem Version](https://badge.fury.io/rb/js-namespace-rails.svg)](https://badge.fury.io/rb/js-namespace-rails)


Rails's asset pipeline compiles all of js file into a single file which is executed on all pages.
There has a problem, some time we want to execute selective code on specific page, but asset pipeline doesn't support.
js-namespace-rails can handle this problem by using it's method to namespace and selectively execute certain javascript depending on which Rails controller action is active.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'js-namespace-rails'
```

## Setup

Require js-namespace-rails file in application.js or other main file,
**notice** js-namespace-rails has no dependency

``` js

//= require js-namespace-rails

```


## Usage
Assume your project have articles_controller
``` ruby
class ArticlesController < ApplicationController
  def index
  end
end
```
And its corresponding js file app/assets/javascripts/articles.js.erb

then you just need to write below into the js file
``` js
// app/assets/javascripts/articles.js.erb
JsSpace.on('articles', {
  init: function(){
  	console.log('common logic of article in here');
  },
  index: function(){
  	console.log('logic of index action in here');
  }
});
```

## Feature
### Passing Parameters to js
```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    js author: @article.author
    # also you can passing an object
    js article: @article
  end
end
```

```js
// app/assets/javascripts/articles.js.erb
JsSpace.on('articles', {
  show: function(){
    console.log(this.params.author); // get author from params
    console.log(this.params.article.title); // get title of article
  }
});
```
## License
MIT License.

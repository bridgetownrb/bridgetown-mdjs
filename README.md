# bridgetown-mdjs

A [Bridgetown](https://www.bridgetownrb.com) plugin to add Kramdown-based support for [Markdown JavaScript (mdjs)](https://rocket.modern-web.dev/docs/markdown-javascript/overview/).

mdjs is a format which allows you to write executable JavaScript from within Markdown files. The mdjs-compatible parser will extract any fenced code block marked as `js script` and later include the extraction(s) within a `<script type="module">` tag at the bottom of the page layout. This means you can import libraries and web components and define various bits of JS inline with your Markdown content.

(**Note:** While the mdjs support in Rocket includes stories and HTML component previews, in this initial release for Bridgetown we're only supporting the basic JavaScript code extractions.)

_Requires Bridgetown 0.21 or higher._

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgetown-mdjs -g bridgetown_plugins
```

Then add either a Liquid tag or Ruby helper to your default layout right below the main content.

```html
<!-- Liquid -->
<main>
   {{ content }}
   {% mdjs_script %}
</main>

<!-- ERB -->
<main>
  <%= yield %>
  <%= mdjs_script %>
</main>
```

## Usage

The plugin will perform the necessary extractions (via the [kramdown-parser-gfm-extractions](https://github.com/bridgetownrb/kramdown-parser-gfm-extractions) add-on) to any Markdown file in your Bridgetown site.

Here's an example Markdown file where you can see mdjs in action:

~~~markdown
# Introducing mdjs

Let's import some components from Skypack!

```js script
import SlIcon from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/components/icon/icon.js"
import SlIconButton from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/components/icon-button/icon-button.js"
import { setBasePath } from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/utilities/base-path.js"

setBasePath("https://cdn.skypack.dev/@shoelace-style/shoelace/dist")
```

## Hello from Shoelace!

<sl-icon-button name="emoji-smile" label="Yo!"></sl-icon-button>

And it's easy to change the DOM…

<aside id="hey-hey"></aside>

```js script
document.querySelector("#hey-hey").innerHTML = "<p>You you!</p>"
```
~~~

### Optional configuration options

By default, extraction tags (inert, using `template`) aren't included in the rendered output HTML. You can change those options inside the `kramdown` namespace in `bridgetown.config.yml`. See [kramdown-parser-gfm-extractions](https://github.com/bridgetownrb/kramdown-parser-gfm-extractions) README for further details.

## Testing

* Run `bundle exec rake test` to run the test suite
* Run `rubocop` to check for any style offenses.

## Releasing

* Run `bundle exec rake test_and_release` to verify rubocop and tests before releasing a new gem.

## Contributing

1. Fork it (https://github.com/bridgetownrb/bridgetown-mdjs/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

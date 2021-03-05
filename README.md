# bridgetown-mdjs

A Bridgetown plugin to add Kramdown-based support for Markdown With JavaScript (mdjs).

**UNDER CONSTRUCTION**

~~~ markdown
# Introducing mdjs

Let's import some components from Skypack!

```js script
import SlIcon from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/components/icon/icon.js"
import SlIconButton from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/components/icon-button/icon-button.js"
import { setBasePath } from "https://cdn.skypack.dev/@shoelace-style/shoelace/dist/utilities/base-path.js"

setBasePath("https://cdn.skypack.dev/@shoelace-style/shoelace/dist")
SlIcon.register()
SlIconButton.register()
```

## Hello from Shoelace!

<sl-icon-button name="emoji-smile" label="Yo!"></sl-icon-button>

And it's easy to change the DOM…

<aside id="hey-hey"></aside>

```js script
document.querySelector("#hey-hey").innerHTML = "<p>You you!</p>"
```
~~~

## Installation

Run this command to add this plugin to your site's Gemfile:

```shell
$ bundle add bridgtown-mdjs -g bridgetown_plugins
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

The plugin will

### Optional configuration options

The plugin will automatically use any of the following metadata variables if they are present in your site's `_data/site_metadata.yml` file.

…

## Testing

* Run `bundle exec rspec` to run the test suite
* Or run `script/cibuild` to validate with Rubocop and test with rspec together.

## Contributing

1. Fork it (https://github.com/username/my-awesome-plugin/fork)
2. Clone the fork using `git clone` to your local development machine.
3. Create your feature branch (`git checkout -b my-new-feature`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create a new Pull Request

----

## Releasing (you can delete this section in your own plugin repo)

To release a new version of the plugin, simply bump up the version number in both `version.rb` and
`package.json`, and then run `script/release`. This will require you to have a registered account
with both the [RubyGems.org](https://rubygems.org) and [NPM](https://www.npmjs.com) registries.
You can optionally remove the `package.json` and `frontend` folder if you don't need to package frontend
assets for Webpack.

If you run into any problems or need further guidance, please check out our [Bridgetown community resources](https://www.bridgetownrb.com/docs/community)
where friendly folks are standing by to help you build and release your plugin or theme.

**NOTE:** make sure you add the `bridgetown-plugin` [topic](https://github.com/topics/bridgetown-plugin) to your
plugin's GitHub repo so the plugin or theme will show up on [Bridgetown's official Plugin Directory](https://www.bridgetownrb.com/plugins)! (There may be a day or so delay before you see it appear.)

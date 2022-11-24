### A Pluto.jl notebook ###
# v0.19.16

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ a7d7427f-c676-4c29-92b2-8f3276c70546
using PlutoUI, HypertextLiteral

# ╔═╡ afd0f3cb-2c76-4e53-8670-86f5dbc4b1f4
md"""
# Using _JavaScript_ inside Pluto

You have already seen that Pluto is designed to be _interactive_. You can make fantastic explorable documents using just the basic inputs provided by PlutoUI, together with the wide range of visualization libraries that Julia offers.

_However_, if you want to take your interactive document one step further, then Pluto offers a great framework for **combining Julia with HTML, CSS and _JavaScript_**.
"""

# ╔═╡ f18691ed-2810-4242-8bad-d5f561b40d10
md"""
## Prerequisites

This document assumes that you have used HTML, CSS and JavaScript before in another context. If you know Julia, and you want to add these web languages to your skill set, we encourage you to do so! It will be useful knowledge, also outside of Pluto.

"""

# ╔═╡ 12c6bf0c-8847-49f3-9f04-1803b0df1577
@htl("""

<article class="learning">
	<h4>
		Learning HTML and CSS
	</h4>
	<p>
		It is easy to learn HTML and CSS because they are not 'programming languages' like Julia and JavaScript, they are <em>markup languages</em>: there are no loops, functions or arrays, you only <em>declare</em> how your document is structured (HTML) and what that structure looks like on a 2D color display (CSS).
	</p>
	<p>
		As an example, this is what this cell looks like, written in HTML and CSS:
	</p>
</article>


<style>

	article.learning {
		background: #f996a84f;
		padding: 1em;
		border-radius: 5px;
	}

	article.learning h4::before {
		content: "☝️";
	}

	article.learning p::first-letter {
		font-size: 1.5em;
		font-family: cursive;
	}

</style>
""")

# ╔═╡ 2e6bd38f-d1e4-43ac-a906-1597aac84357
md"""
> My personal favourite resource for learning HTML and CSS is the [Mozilla Developer Network (MDN)](https://developer.mozilla.org/en-US/docs/Web/CSS). 
> 
> _-fons_
"""

# ╔═╡ fea77ef5-5ac7-4516-872c-351a63f0e57b
md"""
#### Learning JavaScript
After learning HTML and CSS, you can already spice up your Pluto notebooks by creating custom layouts, generated dynamically from Julia data. To take things to the next level, you can learn JavaScript. We recommend using an online resource for this. 

> My personal favourite is [javascript.info](https://javascript.info/), a high-quality, open source tutorial. I use it too!
> 
> _-fons_

It is hard to say whether it is easy to _learn JavaScript using Pluto_. On one hand, we highly recommend the high-quality public learning material that already exists for JavaScript, which is generally written in the context of writing traditional web apps. On the other hand, if you have a specific Pluto-related project in mind, then this could be a great motivator to continue learning!

A third option is to learn JavaScript using [observablehq.com](https://observablehq.com), an online reactive notebook for JavaScript (it's awesome!). Pluto's JavaScript runtime is designed to be very close to the way you write code in observable, so the skills you learn there will be transferable!

If you chose to learn JavaScript using Pluto, let me know how it went, and how we can improve! [fons@plutojl.org](mailto:fons@plutojl.org)
"""

# ╔═╡ 5f57bc58-a6df-493e-bb32-4fd63f3f1993
TableOfContents()

# ╔═╡ 2b7f638e-b40a-4a64-880e-ca2fbe241c06
md"""
# Essentials

## Using HTML, CSS and JavaScript

To use web languages inside Pluto, we recommend the small package [`HypertextLiteral.jl`](https://github.com/MechanicalRabbit/HypertextLiteral.jl), which provides an `@htl` macro.

You wrap `@htl` around a string expression to mark it as an *HTML literal*, as we did in the example cell from earlier. When a cell outputs an HTML-showable object, it is rendered directly in your browser.
"""

# ╔═╡ 57ce69f7-1035-4b20-8258-fd7dc38ccbcc
@htl(" <b> Hello! </b> ")

# ╔═╡ 26f4b552-36bc-4bb4-b75f-51dd7a698870
md"""
### CSS and JavaScript

You can use CSS and JavaScript by including it inside HTML, just like you do when writing a web page.

For example, here we use `<script>` to include some JavaScript, and `<style>` to include CSS.
"""

# ╔═╡ 5166ef4a-44aa-44c1-a858-61b5a8d14f85
@htl("""

<div class='blue-background'>
Hello!
</div>

<script>
// more about selecting elements later!
currentScript.previousElementSibling.innerText = "Hello from JavaScript!"

</script>

<style>
.blue-background {
	padding: .5em;
	background: lightblue;
	color: black;
}
</style>

""")

# ╔═╡ b524bbbb-5ca9-474c-82ed-0274d1d3a9c1
md"""
## Interpolation

Julia has a nice feature: _string interpolation_:
"""

# ╔═╡ 78aa50ba-1cd0-455f-94cb-e5f930b63d24
who = "🌍"

# ╔═╡ fc15bdf4-df5c-49ee-967b-52812243aa44
"Hello $(who)!"

# ╔═╡ f8cf7ec6-7ec8-48db-a8c9-ca7ec7bac5b0
md"""
With some (frustrating) exceptions, you can also interpolate into Markdown literals:
"""

# ╔═╡ 62c2a9f3-5bad-42d1-a881-2c3efbba44cb
md"""
Hello $(who)!
"""

# ╔═╡ c4bcae12-a483-4643-98b8-44e245e3af55
md"""
**However**, you cannot interpolate into an `html"` string:
"""

# ╔═╡ 69c63214-b24d-4ab4-832a-9363fcfa02b9
html"""
<p>Hello $(who)!</p>
"""

# ╔═╡ 2ae32036-fd0f-4977-b54f-1bbe2d541543
md"""

😢 Luckily we can perform these kinds of interpolations (and much more) with the `@htl` macro, as we will see next.


### Interpolating into HTML -- HypertextLiteral.jl
"""

# ╔═╡ fd3ab7d8-d381-43e3-ab97-c0ba3dad8f32
@htl("""
	<p> Hello $(who)!</p>
	""")

# ╔═╡ c61a6c98-2da2-4485-aaf4-233e9e93bae0
cool_features = [
	md"Interpolate any **HTML-showable object**, such as plots and images, or another `@htl` literal."
	md"Interpolated lists are expanded _(like in this cell!)_."
	"Easy syntax for CSS"
	]

# ╔═╡ bed7e6c3-ea3e-492a-b915-a6a1eea28a51
@htl("""
	<p>It has a bunch of very cool features! Including:</p>
	<ul>$([
		@htl(
			"<li>$(item)</li>"
		)
		for item in cool_features
	])</ul>
	""")

# ╔═╡ 462740c7-c257-419d-8946-3e35634d0d3e
md"""
#### Why not just `HTML(...)`?

You might be thinking, why don't we just use the `HTML` function, together with string interpolation? The main problem is correctly handling HTML _escaping rules_. For example:
"""

# ╔═╡ 427ad672-55ed-499a-9339-7cc49be0b4c6
cool_elements = "<div> and <marquee>"

# ╔═╡ e44a864a-74e1-4b26-92a5-58f91a45e385
HTML("""
<h6> My favourite HTML elements are $(cool_elements)!</h6>
""")

# ╔═╡ 151db7dc-0a7c-4b9a-8d67-a9d90f0106dc
@htl("""
<h6> My favourite HTML elements are $(cool_elements)!</h6>
""")

# ╔═╡ e56d7b7f-f7a2-44c1-9889-790d10de9e07
md"""
### Interpolating into JS -- _HypertextLiteral.jl_

As we see above, using HypertextLiteral.jl, we can interpolate objects (numbers, string, images) into HTML output, great! Next, we want to **interpolate _data_ into _scripts_**. Although you could use `JSON.jl`, HypertextLiteral.jl actually has this ability built-in! 

> When you **interpolate Julia objects into a `<script>` tag** using the `@htl` macro, it will be converted to a JS object _automatically_. 
"""

# ╔═╡ ceff7356-8e6d-4ace-84aa-5b570ba6926b
simple_data = (msg="Hello! ", times=3)

# ╔═╡ 6ef7e454-da1f-404a-81cd-58451d42e916
@htl("""
	<script>

	// interpolate the data 🐸
	const data = $(simple_data)

	const span = document.createElement("span")
	span.innerText = data.msg.repeat(data.times)
	
	return span
	</script>
""")

# ╔═╡ a6663d10-7331-455c-8965-26fdcf509455
md"""
**Let's look at a more exciting example:**
"""

# ╔═╡ a476f8dd-fb7e-47a8-b4f7-161c65b66cc6
@bind fantastic_x Slider(0:400)

# ╔═╡ 8c3cfbb2-4135-4ee7-82eb-e723c118ac76
my_data = [
	(name="Cool", coordinate=[100, 100]),
	(name="Awesome", coordinate=[200, 100]),
	(name="Fantastic!", coordinate=[fantastic_x, 150]),
]

# ╔═╡ fead45aa-a095-474d-ac33-292c37188f17
@htl("""
	<script src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>

	<script>

	// interpolate the data 🐸
	const data = $(my_data)

	const svg = DOM.svg(600,200)
	const s = d3.select(svg)

	s.selectAll("text")
		.data(data)
		.join("text")
		.attr("x", d => d.coordinate[0])
		.attr("y", d => d.coordinate[1])
		.style("fill", "red")
		.text(d => d.name)

	return svg
	</script>
""")

# ╔═╡ b38d74b5-e281-4069-b081-9d4e9c24893a
md"""
## Custom `@bind` output
"""

# ╔═╡ 4135944e-bfd1-4d70-9c1f-4e29527f64c5
md"""
**You can use JavaScript to write input widgets.** The `input` event can be triggered on any object using

```javascript
obj.value = ...
obj.dispatchEvent(new CustomEvent("input"))
```

For example, here is a button widget that will send the number of times it has been clicked as the value:

"""

# ╔═╡ 3c7585d4-7a15-4020-8e12-3f5ac094cddb
ClickCounter(text="Click") = @htl("""
<span>
<button>$(text)</button>

<script>

	// Select elements relative to `currentScript`
	const span = currentScript.parentElement
	const button = span.querySelector("button")

	// we wrapped the button in a `span` to hide its default behaviour from Pluto

	let count = 0

	button.addEventListener("click", (e) => {
		count += 1

		// we dispatch the input event on the span, not the button, because 
		// Pluto's `@bind` mechanism listens for events on the **first element** in the
		// HTML output. In our case, that's the span.

		span.value = count
		span.dispatchEvent(new CustomEvent("input"))
		e.preventDefault()
	})

	// Set the initial value
	span.value = count

</script>
</span>
""")

# ╔═╡ ae257acf-b821-4e10-9563-2afdb32eb7e4
@bind num_clicks ClickCounter()

# ╔═╡ 2c3b1658-2bca-453e-be5e-288c148fd11a
num_clicks

# ╔═╡ dc17c136-30c4-4a75-9e96-68b1d5038fdf
md"""
As an exercise to get familiar with these techniques, you can try the following:
- 👉 Add a "reset to zero" button to the widget above.
- 👉 Make the bound value an array that increases size when you click, instead of a single number.
- 👉 Create a "two sliders" widget: combine two sliders (`<input type=range>`) into a single widget, where the bound value is the two-element array with both values.
- 👉 Create a "click to send" widget: combine a text input and a button, and only send the contents of the text field when the button is clicked, not on every keystroke.

Questions? Ask them on our [GitHub Discussions](https://github.com/fonsp/Pluto.jl/discussions)!
"""

# ╔═╡ 421432f6-539d-4ebc-a638-f13068bc86f1
md"""
## Debugging

The HTML, CSS and JavaScript that you write run in the browser, so you should use the [browser's built-in developer tools](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_are_browser_developer_tools) to debug your code. 
"""

# ╔═╡ c9bfb241-c03d-4c00-b7d8-e9b4a7edd0c2
@htl("""

<script>

console.info("Can you find this message in the console?")

</script>

""")

# ╔═╡ b3b72616-112d-4c4b-8f44-afe77927b0e2
@htl("""
	<style>
	.cool-class {
		font-size: 1.3rem;
		color: purple;
		background: lightBlue;
		padding: 1rem;
		border-radius: 1rem;
	}
	
	
	</style>
	
	<div class="cool-class">Can you find out which CSS class this is?</div>
	""")

# ╔═╡ d1f00a21-76fa-4437-aea3-748df90bf026
md"""
## Selecting elements

When writing the javascript code for a widget, it is common to **select elements inside the widgets** to manipulate them. In the number-of-clicks example above, we selected the `<span>` and `<button>` elements in our code, to trigger the input event, and attach event listeners, respectively.

There are a numbers of ways to do this, and the recommended strategy is to **create a wrapper `<span>`, and use `currentScript.parentElement` to select it**.

### `currentScript`

When Pluto runs the code inside `<script>` tags, it assigns a reference to that script element to a variable called `currentScript`. You can then use properties like `previousElementSibling` or `parentElement` to "navigate to other elements".

Let's look at the "wrapper span strategy" again.

```htmlmixed
@htl("\""

<!-- the wrapper span -->
<span>

	<button id="first">Hello</button>
	<button id="second">Julians!</button>
	
	<script>
		const wrapper_span = currentScript.parentElement
		// we can now use querySelector to select anything we want
		const first_button = wrapper_span.querySelector("button#first")

		console.log(first_button)
	</script>
</span>
"\"")
```
"""

# ╔═╡ 84fbb315-8228-4c4e-a773-7ccf60d160f6
md"""
#### Why not just select on `document.body`?

In the example above, it would have been easier to just select the button directly, using:
```javascript
// ⛔ do no use:
const first_button = document.body.querySelector("button#first")
```

However, this becomes a problem when **combining using the widget multiple times in the same notebook**, since all selectors will point to the first instance. 

Similarly, try not to search relative to the `<pluto-cell>` or `<pluto-output>` element, because users might want to combine multiple instances of the widget in a single cell.
"""

# ╔═╡ 60532be5-0640-4a6e-9343-ca882267af08
md"""
## Script loading

To use external javascript dependencies, you can load them from a CDN, such as:
- [jsdelivr.com](https://www.jsdelivr.com/)
- [esm.sh](https://esm.sh)

Just like when writing a browser app, there are two ways to import JS dependencies: a `<script>` tag, and the more modern ES6 import.

### Loading method 1: ES6 imports

We recommend that you use an [**ES6 import**](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Modules) if the library supports it. (If it does not, you might be able to still get it using [esm.sh](https://esm.sh) or [skypack.dev](https://www.skypack.dev)!)


##### Awkward note about syntax

Normally, you can import libraries inside JS using the import syntax:
```javascript
// ⛔ do no use:
import confetti from "https://esm.sh/canvas-confetti@1.4.0"
import { html, render, useEffect } from "https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs"
```

In Pluto, this is [currently not yet supported](https://github.com/fonsp/Pluto.jl/issues/992), and you need to use a different syntax as workaround:
```javascript
// ✔ use:
const { default: confetti } = await import("https://esm.sh/canvas-confetti@1.4.0")
const { html, render, useEffect } = await import("https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs")
```
"""

# ╔═╡ 290a4f29-3c83-4d13-aaf1-0a79de2f7ea6
md"""

### Loading method 2: script tag

`<script src="...">` tags with a `src` attribute set, like this tag to import the d3.js library:

```html
<script src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>
```

will work as expected. The execution of other script tags within the same cell is delayed until a `src` script finished loading, and Pluto will make sure that every source file is only loaded once.
"""

# ╔═╡ 9d475489-4c30-4b1c-ae19-3f9ab7252677
md"""
### Pinning versions

When using a CDN almost **never** want to use an unpinned import. Always version your CDN imports!
```js
// ⛔ do no use:
"https://esm.sh/canvas-confetti"
"https://cdn.jsdelivr.net/npm/htm/preact/standalone.mjs"

// ✔ use:
"https://esm.sh/canvas-confetti@1.4.0"
"https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs"
```
"""

# ╔═╡ 2a7aacfd-b0ed-411e-ab72-9f8cd4ca615e
md"""
# Advanced
"""

# ╔═╡ 616cab5d-94f4-4784-807c-b94d09734a5d
md"""
## Script output & `observablehq/stdlib`

Pluto's original inspiration was [observablehq.com](https://observablehq.com/), and online reactive notebook for JavaScript. _(It's REALLY good, try it out!)_ We design Pluto's JavaScript runtime to be close to the way you write code in observable.

Read more about the observable runtime in their (interactive) [documentation](https://observablehq.com/@observablehq/observables-not-javascript). The following is also true for JavaScript-inside-scripts in Pluto:
- ⭐️ If you return an HTML node, it will be displayed.
- ⭐️ The [`observablehq/stdlib`](https://observablehq.com/@observablehq/stdlib) library is pre-imported, you can use `DOM`, `html`, `Promises`, etc.
- ⭐️ When a cell re-runs reactively, `this` will be set to the previous output (with caveat, see the later section)
- The variable `invalidation` is a Promise that will get resolved when the cell output is changed or removed. You can use this to remove event listeners, for example.
- You can use top-level `await`, and a returned HTML node will be displayed when ready.
- Code is run in "strict mode", use `let x = 1` instead of `x = 1`.

The following is different in Pluto:
- JavaScript code is not reactive, there are no global variables.
- Cells can contain multiple script tags, and they will run consecutively (also when using `await`)
- We do not (yet) support async generators, i.e. `yield`.
- We do not support the observable keywords `viewof` and `mutable`.
"""

# ╔═╡ d2af96e7-6b43-40ce-91f2-82ccfdf9a532
md"""
### Example: 
(Though using `HypertextLiteral.jl` would make more sense for this purpose.)
"""

# ╔═╡ 3def74e7-2c6e-4108-84aa-114530bac308
films = [
	(title="Frances Ha", director="Noah Baumbach", year=2012),
	(title="Portrait de la jeune fille en feu", director="Céline Sciamma", year=2019),
	(title="De noorderlingen", director="Alex van Warmerdam", year=1992),
];

# ╔═╡ 3296699c-5b65-4f2c-889d-5279b5c1b0ee
@htl("""
	<script>
	
	let data = $(films)
	
	// html`...` is from https://github.com/observablehq/stdlib
	// note the escaped dollar signs:
	let Film = ({title, director, year}) => html`
		<li class="film">
			<b>\${title}</b> by <em>\${director}</em> (\${year})
		</li>
	`
	
	// the returned HTML node is rendered
	return html`
		<ul>
			\${data.map(Film)}
		</ul>
	`
	
	</script>
	""")

# ╔═╡ 34c8b43e-5743-4395-976a-8f849c56d419
md"""
## Stateful output with `this`

Just like in observablehq, if a cell _re-runs reactively_, then the javascript variable `this` will take the value of the last thing that was returned by the script. If the cell runs for the first time, then `this == undefined`. In particular, if you return an HTML node, and the cell runs a second time, then you can access the HTML node using `this`. Two reasons for using this feature are:
- Stateful output: you can persist some state in-between re-renders. 
- Performance: you can 'recycle' the previous DOM and update it partially (using d3, for example). _When doing so, Pluto guarantees that the DOM node will always be visible, without flicker._

##### 'Re-runs reactively'?
With this, we mean that the Julia cell re-runs not because of user input (Ctrl+S, Shift+Enter or clicking the play button), but because it was triggered by a variable reference.

##### ☝️ Caveat
This feature is **only enabled** for `<script>` tags with the `id` attribute set, e.g. `<script id="first">`. Think of setting the `id` attribute as saying: "I am a Pluto script". There are two reasons for this:
- One Pluto cell can output multiple scripts, Pluto needs to know which output to assign to which script.
- Some existing scripts assume that `this` is set to `window` in toplevel code (like in the browser). By hiding the `this`-feature behind this caveat, we still support libraries that output such scripts.

"""

# ╔═╡ 7ecec745-ac53-4b51-a398-9597d4ea24ec
trigger = "edit me!"

# ╔═╡ 13a1d8b6-31c8-4de5-843d-d9beb92e74a5
let
	trigger
	
	html"""
	<script id="something">
	
	console.log("'this' is currently:", this)

	if(this == null) {
		return html`<blockquote>I am running for the first time!</blockqoute>`
	} else {
		return html`<blockquote><b>I was triggered by reactivity!</b></blockqoute>`
	}


	</script>
	"""
end

# ╔═╡ fe09f81f-9492-4045-9b6a-7d671fde674e
md"""
### Example: d3.js transitions

Type the coordinates of the circles here! 
"""

# ╔═╡ ecff2340-7bbe-42b6-878a-d61234e24a08
@bind positions TextField(default="100, 300")

# ╔═╡ 3a3eb5f4-05ef-46f4-b61a-b2c20b344d62
dot_positions = try
	parse.([Int], split(replace(positions, ',' => ' ')))
catch e
	[100, 300]
end

# ╔═╡ d0cead38-14ad-4e13-8c37-e8f9a7b079a7
# dot_positions = [100, 300] # edit me!

# ╔═╡ 03c08041-1a4a-4686-80da-7e904b157470
md"""
Notice that, even though the cell below re-runs, we **smoothly transition** between states. We use `this` to maintain the d3 transition states in-between reactive runs.
"""

# ╔═╡ df74172a-d57c-4d85-b578-158a7a515e04
@htl("""
<script src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>

<script id="hello">

const positions = $(dot_positions)
	
const svg = this == null ? DOM.svg(600,200) : this
const s = this == null ? d3.select(svg) : this.s

s.selectAll("circle")
	.data(positions)
	.join("circle")
    .transition()
    .duration(300)
	.attr("cx", d => d)
	.attr("cy", 100)
	.attr("r", 10)
	.attr("fill", "gray")


const output = svg
output.s = s
return output
</script>

""")

# ╔═╡ 55f09eb6-6ba1-4ae4-a687-e7f5757eae51
md"""
### Example: Preact with persistent state
"""

# ╔═╡ b7879599-9296-4b9f-9aa3-2bb23abd2f01
md"""
Modify `x`, add and remove elements, and notice that preact maintains its state.
"""

# ╔═╡ 477617d4-cdfb-42c9-bbaa-ce29939a0367
x = ["hello pluton!", 232000,2,2,12 ,12,2,21,1,2, 120000]

# ╔═╡ 16cfd139-7539-4d3a-b746-f18096e5d2b9
state = Dict(
	:x => x
	)

# ╔═╡ dde68198-7cd3-4fbe-80be-77c907876ad4
@htl("""
<script id="asdf">
	//await new Promise(r => setTimeout(r, 1000))
	
	const { html, render, Component, useEffect, useLayoutEffect, useState, useRef, useMemo, createContext, useContext, } = await import( "https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs")

	const node = this ?? document.createElement("div")
	
	const new_state = $(state)
	
	if(this == null){
	
		// PREACT APP STARTS HERE
		
		const Item = ({value}) => {
			const [loading, set_loading] = useState(true)

			useEffect(() => {
				set_loading(true)

				const handle = setTimeout(() => {
					set_loading(false)
				}, 1000)

				return () => clearTimeout(handle)
			}, [value])

			return html`<li>\${loading ? 
				html`<em>Loading...</em>` : 
				value
			}</li>`
		}

        const App = () => {

            const [state, set_state] = useState(new_state)
            node.set_app_state = set_state

            return html`<h5>Hello world!</h5>
                <ul>\${
                state.x.map((x,i) => html`<\${Item} value=\${x} key=\${i}/>`)
            }</ul>`;
        }

		// PREACT APP ENDS HERE

        render(html`<\${App}/>`, node);
	
	} else {
		
		node.set_app_state(new_state)
	}
	return node
</script>
	
	
""")

# ╔═╡ 7393ebe6-4eef-4ef7-bb57-9ccbae36c7c6
md"""
## Embedding Julia data directly into JavaScript!

You can use `Main.PlutoRunner.publish_to_js` to embed data directly into JavaScript, using Pluto's built-in, optimized data transfer. See [the Pull Request](https://github.com/fonsp/Pluto.jl/pull/1124) for more info.

Example usage:

```julia
let
	x = rand(UInt8, 10_000)
	
	d = Dict(
		"some_raw_data" => x,
		"wow" => 1000,
	)
	
	@htl(\"\"\"
	<script>
		
	const d = $(Main.PlutoRunner.publish_to_js(d))
	console.log(d)
	
	</script>
	\"\"\")
end
```

In this example, the `const d` is populated from a hook into Pluto's data transfer. For large amounts of typed vector data (e.g. `Vector{UInt8}` or `Vector{Float64}`), this is *much* more efficient than interpolating the data directly with HypertextLiteral using `$(d)`, which would use a JSON-like string serialization.

**Note:** this API is still *experimental*, and might change in the future.
"""

# ╔═╡ 1aca7f23-6a38-4873-b8f6-eb3bfa263369
md"""
# Appendix
"""

# ╔═╡ ccc148d4-fcc9-4add-b302-1964df7d9bb0
details(x, summary="Show more") = @htl("""
	<details>
		<summary>$(summary)</summary>
		$(x)
	</details>
	""")

# ╔═╡ 60b6a075-eb2a-4d96-b60d-99799fd49c2c
details(md"""
	```htmlmixed
	
	<article class="learning">
		<h4>
			Learning HTML and CSS
		</h4>
		<p>
			It is easy to learn HTML and CSS because they are not 'programming languages' like Julia and JavaScript, they are <em>markup languages</em>: there are no loops, functions or arrays, you only <em>declare</em> how your document is structured (HTML) and what that structure looks like on a 2D color display (CSS).
		</p>
		<p>
			As an example, this is what this cell looks like, written in HTML and CSS:
		</p>
	</article>


	<style>

		article.learning {
			background: #fde6ea4c;
			padding: 1em;
			border-radius: 5px;
		}

		article.learning h4::before {
			content: "☝️";
		}

		article.learning p::first-letter {
			font-size: 1.5em;
			font-family: cursive;
		}

	</style>
	```
	""", "Show with syntax highlighting")

# ╔═╡ 3975e46c-e754-4547-8887-6a846d2ed96b
details(md"""
	```htmlmixed
	<script>

	// interpolate the data 🐸
	const data = $(simple_data)

	const span = document.createElement("span")
	span.innerText = data.msg.repeat(data.times)
	
	return span
	</script>
	```
	""", "Show with syntax highlighting")

# ╔═╡ 3aea00e5-81e9-46c0-b3a9-d7ee8cd1997c
details(md"""
	```htmlmixed
	<script src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>

	<script>

	// interpolate the data 🐸
	const data = $(my_data)

	const svg = DOM.svg(600,200)
	const s = d3.select(svg)

	s.selectAll("text")
		.data(data)
		.join("text")
		.attr("x", d => d.coordinate[0])
		.attr("y", d => d.coordinate[1])
		.style("fill", "red")
		.text(d => d.name)

	return svg
	</script>
	```
	""", "Show with syntax highlighting")

# ╔═╡ 2b6e7280-2455-4ea0-b370-cbbd6a0e0b03
details(md"""
```htmlmixed
<div>
<button>$(text)</button>

<script>

	// Select elements relative to `currentScript`
	const div = currentScript.parentElement
	const button = div.querySelector("button")

	// we wrapped the button in a `div` to hide its default behaviour from Pluto

	let count = 0

	button.addEventListener("click", (e) => {
		count += 1

		// we dispatch the input event on the div, not the button, because 
		// Pluto's `@bind` mechanism listens for events on the **first element** in the
		// HTML output. In our case, that's the div.

		div.value = count
		div.dispatchEvent(new CustomEvent("input"))
		e.preventDefault()
	})

	// Set the initial value
	div.value = count

</script>
</div>
```
""", "Show with syntax highlighting")

# ╔═╡ e8fd7764-3df4-49df-ac24-6ccb16bdac27
details(md"""
	```htmlmixed
	<script>
	
	let data = $(films)
	
	// html`...` is from https://github.com/observablehq/stdlib
	// note the escaped dollar signs:
	let Film = ({title, director, year}) => html`
		<li class="film">
			<b>\${title}</b> by <em>\${director}</em> (\${year})
		</li>
	`
	
	// the returned HTML node is rendered
	return html`
		<ul>
			\${data.map(Film)}
		</ul>
	`
	
	</script>
	```
	""", "Show with syntax highlighting")

# ╔═╡ f3a034e2-e67f-4c13-a674-2a4807d70e10
details(md"""
	```htmlmixed
	<script id="something">
	
	console.log("'this' is currently:", this)

	if(this == null) {
		return html`<blockquote>I am running for the first time!</blockqoute>`
	} else {
		return html`<blockquote><b>I was triggered by reactivity!</b></blockqoute>`
	}


	</script>
	```
	""", "Show with syntax highlighting")

# ╔═╡ b1817cee-4107-4b2e-8b85-9b0e4676323d
details(md"""
```htmlmixed
<script src="https://cdn.jsdelivr.net/npm/d3@6.2.0/dist/d3.min.js"></script>

<script id="hello">

const positions = $(dot_positions)

const svg = this == null ? DOM.svg(600,200) : this
const s = this == null ? d3.select(svg) : this.s

s.selectAll("circle")
	.data(positions)
	.join("circle")
	.transition()
	.duration(300)
	.attr("cx", d => d)
	.attr("cy", 100)
	.attr("r", 10)
	.attr("fill", "gray")


const output = svg
output.s = s
return output
</script>
```
""", "Show with syntax highlighting")

# ╔═╡ e1d8f176-e845-4b44-9097-ce6c9c7b31d0
details(md"""
	```htmlmixed
	<script type="module" id="asdf">
		//await new Promise(r => setTimeout(r, 1000))

		const { html, render, Component, useEffect, useLayoutEffect, useState, useRef, useMemo, createContext, useContext, } = await import( "https://cdn.jsdelivr.net/npm/htm@3.0.4/preact/standalone.mjs")

		const node = this ?? document.createElement("div")

		const new_state = $(state)

		if(this == null){

			// PREACT APP STARTS HERE

			const Item = ({value}) => {
				const [loading, set_loading] = useState(true)

				useEffect(() => {
					set_loading(true)

					const handle = setTimeout(() => {
						set_loading(false)
					}, 1000)

					return () => clearTimeout(handle)
				}, [value])

				return html`<li>\${loading ? 
					html`<em>Loading...</em>` : 
					value
				}</li>`
			}

			const App = () => {

				const [state, set_state] = useState(new_state)
				node.set_app_state = set_state

				return html`<h5>Hello world!</h5>
					<ul>\${
					state.x.map((x,i) => html`<\${Item} value=\${x} key=\${i}/>`)
				}</ul>`;
			}

			// PREACT APP ENDS HERE

			render(html`<\${App}/>`, node);

		} else {

			node.set_app_state(new_state)
		}
		return node
	</script>
	```
	""", "Show with syntax highlighting")

# ╔═╡ 466dfe31-ae26-4746-9591-d0c17f21cede
demo_img = let
	url = "https://user-images.githubusercontent.com/6933510/116753174-fa40ab80-aa06-11eb-94d7-88f4171970b2.jpeg"
	data = read(download(url))
	PlutoUI.Show(MIME"image/jpg"(), data)
end

# ╔═╡ 276b7ff4-b261-4d01-942c-f8e5af68c0e5
demo_html = @htl("<b style='font-family: cursive;'>Hello!</b>")

# ╔═╡ 323bf1ec-e2ad-4608-b9be-27c65f730628
md"""
## Embeddable output

Pluto has a multimedia object viewer, which is used to display the result of a cell's output. Depending on the _type_ of the resulting object, the richest possible viewer is used. This includes:
- an interactive structure viewer for arrays, tables, dictionaries and more: $(embed_display([1,2,(a=3, b=4)]))
- an `<img>` tag with optimized data transfer for images: $(embed_display(demo_img))
- raw HTML for HTML-showable objects: $(embed_display(demo_html))

Normally, you get this object viewer for the _output_ of a cell. However, as demonstrated in the list above, you can also **embed Pluto's object viewer in your own HTML**. To do so, Pluto provides a function:
```julia
embed_display(x)
```

#### Example

As an example, here is how you display two arrays side-by-side:

```julia
@htl("\""

<div style="display: flex;">
$(embed_display(rand(4)))
$(embed_display(rand(4)))
</div>

"\"")

```

You can [learn more](https://github.com/fonsp/Pluto.jl/pull/1126) about how this feature works, or how to use it inside packages.
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
HypertextLiteral = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
HypertextLiteral = "~0.9.4"
PlutoUI = "~0.7.48"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "2c0647ced0fa619ad67726a2f8a1a3b60ebfdac0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "eb7f0f8307f71fac7c606984ea5fb2817275d6e4"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.4"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "0.5.2+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
deps = ["Tricks"]
git-tree-sha1 = "c47c5fa4c5308f27ccaac35504858d8914e102f9"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.4"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.MIMEs]]
git-tree-sha1 = "65f28ad4b594aebe22157d6fac869786a255b7eb"
uuid = "6c6e2e6c-3030-632d-7369-2d6c69616d65"
version = "0.1.4"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates", "SnoopPrecompile"]
git-tree-sha1 = "b64719e8b4504983c7fca6cc9db3ebc8acc2a4d6"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.5.1"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "FixedPointNumbers", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "MIMEs", "Markdown", "Random", "Reexport", "URIs", "UUIDs"]
git-tree-sha1 = "efc140104e6d0ae3e7e30d56c98c4a927154d684"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.48"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SnoopPrecompile]]
git-tree-sha1 = "f604441450a3c0569830946e5b33b78c928e1a85"
uuid = "66db9d55-30c0-4569-8b51-7e840670fc0c"
version = "1.0.1"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.Tricks]]
git-tree-sha1 = "6bac775f2d42a611cdfcd1fb217ee719630c4175"
uuid = "410a4b4d-49e4-4fbc-ab6d-cb71b17b3775"
version = "0.1.6"

[[deps.URIs]]
git-tree-sha1 = "ac00576f90d8a259f2c9d823e91d1de3fd44d348"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.1"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╠═afd0f3cb-2c76-4e53-8670-86f5dbc4b1f4
# ╠═a7d7427f-c676-4c29-92b2-8f3276c70546
# ╠═f18691ed-2810-4242-8bad-d5f561b40d10
# ╠═12c6bf0c-8847-49f3-9f04-1803b0df1577
# ╠═60b6a075-eb2a-4d96-b60d-99799fd49c2c
# ╠═2e6bd38f-d1e4-43ac-a906-1597aac84357
# ╠═fea77ef5-5ac7-4516-872c-351a63f0e57b
# ╠═5f57bc58-a6df-493e-bb32-4fd63f3f1993
# ╠═2b7f638e-b40a-4a64-880e-ca2fbe241c06
# ╠═57ce69f7-1035-4b20-8258-fd7dc38ccbcc
# ╠═26f4b552-36bc-4bb4-b75f-51dd7a698870
# ╠═5166ef4a-44aa-44c1-a858-61b5a8d14f85
# ╠═b524bbbb-5ca9-474c-82ed-0274d1d3a9c1
# ╠═78aa50ba-1cd0-455f-94cb-e5f930b63d24
# ╠═fc15bdf4-df5c-49ee-967b-52812243aa44
# ╠═f8cf7ec6-7ec8-48db-a8c9-ca7ec7bac5b0
# ╠═62c2a9f3-5bad-42d1-a881-2c3efbba44cb
# ╠═c4bcae12-a483-4643-98b8-44e245e3af55
# ╠═69c63214-b24d-4ab4-832a-9363fcfa02b9
# ╠═2ae32036-fd0f-4977-b54f-1bbe2d541543
# ╠═fd3ab7d8-d381-43e3-ab97-c0ba3dad8f32
# ╠═bed7e6c3-ea3e-492a-b915-a6a1eea28a51
# ╠═c61a6c98-2da2-4485-aaf4-233e9e93bae0
# ╠═462740c7-c257-419d-8946-3e35634d0d3e
# ╠═427ad672-55ed-499a-9339-7cc49be0b4c6
# ╠═e44a864a-74e1-4b26-92a5-58f91a45e385
# ╠═151db7dc-0a7c-4b9a-8d67-a9d90f0106dc
# ╠═e56d7b7f-f7a2-44c1-9889-790d10de9e07
# ╠═ceff7356-8e6d-4ace-84aa-5b570ba6926b
# ╠═6ef7e454-da1f-404a-81cd-58451d42e916
# ╠═3975e46c-e754-4547-8887-6a846d2ed96b
# ╠═a6663d10-7331-455c-8965-26fdcf509455
# ╠═8c3cfbb2-4135-4ee7-82eb-e723c118ac76
# ╠═a476f8dd-fb7e-47a8-b4f7-161c65b66cc6
# ╠═fead45aa-a095-474d-ac33-292c37188f17
# ╠═3aea00e5-81e9-46c0-b3a9-d7ee8cd1997c
# ╠═b38d74b5-e281-4069-b081-9d4e9c24893a
# ╠═4135944e-bfd1-4d70-9c1f-4e29527f64c5
# ╠═3c7585d4-7a15-4020-8e12-3f5ac094cddb
# ╠═2b6e7280-2455-4ea0-b370-cbbd6a0e0b03
# ╠═ae257acf-b821-4e10-9563-2afdb32eb7e4
# ╠═2c3b1658-2bca-453e-be5e-288c148fd11a
# ╠═dc17c136-30c4-4a75-9e96-68b1d5038fdf
# ╠═421432f6-539d-4ebc-a638-f13068bc86f1
# ╠═c9bfb241-c03d-4c00-b7d8-e9b4a7edd0c2
# ╠═b3b72616-112d-4c4b-8f44-afe77927b0e2
# ╠═d1f00a21-76fa-4437-aea3-748df90bf026
# ╠═84fbb315-8228-4c4e-a773-7ccf60d160f6
# ╠═60532be5-0640-4a6e-9343-ca882267af08
# ╠═290a4f29-3c83-4d13-aaf1-0a79de2f7ea6
# ╠═9d475489-4c30-4b1c-ae19-3f9ab7252677
# ╠═2a7aacfd-b0ed-411e-ab72-9f8cd4ca615e
# ╠═616cab5d-94f4-4784-807c-b94d09734a5d
# ╠═d2af96e7-6b43-40ce-91f2-82ccfdf9a532
# ╠═3296699c-5b65-4f2c-889d-5279b5c1b0ee
# ╠═e8fd7764-3df4-49df-ac24-6ccb16bdac27
# ╠═3def74e7-2c6e-4108-84aa-114530bac308
# ╠═34c8b43e-5743-4395-976a-8f849c56d419
# ╠═7ecec745-ac53-4b51-a398-9597d4ea24ec
# ╠═13a1d8b6-31c8-4de5-843d-d9beb92e74a5
# ╠═f3a034e2-e67f-4c13-a674-2a4807d70e10
# ╠═fe09f81f-9492-4045-9b6a-7d671fde674e
# ╠═ecff2340-7bbe-42b6-878a-d61234e24a08
# ╠═3a3eb5f4-05ef-46f4-b61a-b2c20b344d62
# ╠═d0cead38-14ad-4e13-8c37-e8f9a7b079a7
# ╠═03c08041-1a4a-4686-80da-7e904b157470
# ╠═df74172a-d57c-4d85-b578-158a7a515e04
# ╠═b1817cee-4107-4b2e-8b85-9b0e4676323d
# ╠═55f09eb6-6ba1-4ae4-a687-e7f5757eae51
# ╠═b7879599-9296-4b9f-9aa3-2bb23abd2f01
# ╠═477617d4-cdfb-42c9-bbaa-ce29939a0367
# ╠═dde68198-7cd3-4fbe-80be-77c907876ad4
# ╠═e1d8f176-e845-4b44-9097-ce6c9c7b31d0
# ╠═16cfd139-7539-4d3a-b746-f18096e5d2b9
# ╠═7393ebe6-4eef-4ef7-bb57-9ccbae36c7c6
# ╠═323bf1ec-e2ad-4608-b9be-27c65f730628
# ╠═1aca7f23-6a38-4873-b8f6-eb3bfa263369
# ╠═ccc148d4-fcc9-4add-b302-1964df7d9bb0
# ╠═466dfe31-ae26-4746-9591-d0c17f21cede
# ╠═276b7ff4-b261-4d01-942c-f8e5af68c0e5
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

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

# ╔═╡ 4eaeb54d-2002-4637-8917-dbae3e1c14a2
using PlutoUI

# ╔═╡ 7f192005-8fda-4232-82ab-d61046ffd233
md"""# PlutoUI.jl

The [Interactivity sample notebook](./sample/Interactivity.jl) explains how Pluto notebooks can use **`@bind`** to add _interactivity_ to your notebook. It's a simple concept - it uses the same reactivity that you have when editing code, except now you use sliders and buttons, instead of editing code.

However, code like

```julia
@bind x html"<input type=range min=5 max=15>"
```
is hard to memorize, so `PlutoUI` makes it more _Julian_:
```julia
@bind x Slider(5:15)
```
"""

# ╔═╡ 68363762-a371-4f3f-b6cb-2fd84adbeec1
md"""
#### To use it in other notebooks
Simply import the `PlutoUI` package, and Pluto's built-in package manager takes care of the rest!
"""

# ╔═╡ a1789ceb-a46f-4962-ba0f-0b38c8309ce6
TableOfContents()

# ╔═╡ 4ac262d9-164b-4c95-879e-48d9616f1ae9
md"""
# Basics
"""

# ╔═╡ dddc984d-195f-4c5b-b8a9-3c97a85bf021
md"## Slider"

# ╔═╡ 5f6cbaae-db0b-4301-ba9f-96c363f10fd4
@bind x Slider(5:15)

# ╔═╡ ccf9da3d-7217-44db-8ae6-ecb99f310099
x

# ╔═╡ 5ea490a1-8a47-4e45-9540-ebece44eaadb
md"The first argument is a `Vector` or range. You can set the _default value_ using a keyword argument:"

# ╔═╡ f4932600-86df-4ee2-80d4-0d8dbd4b5e67
@bind y Slider(20:0.1:30, default=25)

# ╔═╡ 0f95494b-3ed1-4618-9215-dfdffe02730c
y

# ╔═╡ 2a9233be-7807-42fa-ad3a-90ce1f5cee62
md"""
## Scrubbable

`Scrubbable` makes a number interactive, you can **click and drag** its value left or right. 

Try it in the text below:
"""

# ╔═╡ a94ac753-5e6a-4b69-8f1a-eee39a2eaf16
md"""
_If Alice has $(@bind a Scrubbable(20)) apples, 
and she gives $(@bind b Scrubbable(3)) apples to Bob..._
"""

# ╔═╡ 3733ea37-0b3d-4a08-8bd5-3f9e86cfc192
md"""
_...then Alice has **$(a - b)** apples left._
"""

# ╔═╡ b27d120c-86cc-467f-a080-1273a103cb77
md"""
Use the Live Docs to learn more about `Scrubbable`!
"""

# ╔═╡ f6234527-fc7d-45d4-98fb-2c3daff3726f
md"## NumberField

A `NumberField` can be used just like a `Slider`, it just looks different:"

# ╔═╡ 586c136b-2481-49d2-af5d-bbfbb4137e04
@bind x_different NumberField(0:100, default=20)

# ╔═╡ 3975c72c-5728-4e6d-90cf-87f0163e193c
md"## CheckBox"

# ╔═╡ cf429afe-061c-4dfe-ad3c-b2a82897e7ed
@bind z CheckBox()

# ╔═╡ 2b54700e-12d4-4bdf-9dc1-905c191b8229
z

# ╔═╡ 5f184fb1-30fa-4447-bce3-dffbc71f6b41
md"Default value:"

# ╔═╡ 958b45d2-1d82-47b8-a45b-dab58e496e54
@bind having_fun CheckBox(default=true)

# ╔═╡ 43f8252c-d419-4e1b-a4b0-88b585e19f75
having_fun

# ╔═╡ a5614b6d-9abf-4d3e-a3d7-34c28c1a9cb2
having_fun ? md"🎈🎈" : md"☕"

# ╔═╡ 506cd3aa-9d16-496d-bcd7-07c58d0f181e
md"## TextField"

# ╔═╡ c2fc4f6c-f365-4c32-9934-d7027e73927a
@bind s TextField()

# ╔═╡ 49372104-ada2-4831-8b35-96c303fdfdc2
s

# ╔═╡ 623c41c7-7b8d-49f0-a49f-1c731d1c3627
md"With a default value:"

# ╔═╡ 58603f09-9f6d-4474-ae2a-c3338bf7be3a
@bind sentence TextField(default="te dansen omdat men leeft")

# ╔═╡ b7fce26a-ba94-486a-ad6f-6ebbd9b98e72
sentence

# ╔═╡ 618e33f9-4dc3-4098-a07e-f69f50b189fc
md"You can also create a **multi-line** text box!"

# ╔═╡ 71754d60-7e64-4203-91fb-07a86fd56b60
@bind poem TextField((30, 3), "Je opent en sluit je armen,\nMaar houdt niets vast.\nHet is net zwemmen")

# (poem by: Sanne de Kroon)

# ╔═╡ c62b0597-edca-47ed-85eb-5933d402206e
split(poem, "\n")

# ╔═╡ 82c69c22-d00a-4f9d-a6be-b624e41dbb75
md"## Select"

# ╔═╡ a1e472d9-6a17-4fb6-b9d5-27cf6e194894
@bind vegetable Select(["potato", "carrot"])

# ╔═╡ 1e115292-f48d-406a-a8ba-b2285df488bd
vegetable

# ╔═╡ 38b67bd4-e0cc-4788-a23c-2e51d2e35f48
@bind favourite_function Select([sin, cos, tan, sqrt])

# ╔═╡ 6714b776-3784-4e42-bb6b-618fc1103f7c
favourite_function(2)

# ╔═╡ 60fde61e-7300-4f1e-8010-024d982adbf1
md"Instead of an array of values, you can also give an array of **pairs**, where the first item is the bound value, and the second item is displayed. "

# ╔═╡ ca1d952f-74f9-4363-bc6f-96dfd1da8e49
@bind fruit Select(["apple" => "🍎", "melon" => "🍉"])

# ╔═╡ f3d8ccc0-d250-4bd5-beb9-4c3a06ef8912
fruit

# ╔═╡ 69efc9d6-bc11-4ada-9ccc-cc811bb4663d
md"""
## MultiSelect

This widget allows the user to select multiple element by holding `Ctrl` / `Cmd` while clicking a more items.
"""

# ╔═╡ 2a832466-b5cc-43ca-92b1-096f78f5f30a
@bind vegetable_basket MultiSelect(["potato", "carrot", "boerenkool"])

# ╔═╡ 364624fc-20a2-4ce4-9c18-4d00210a8543
vegetable_basket

# ╔═╡ a28b2594-40a9-4cbc-8ae2-1b52517b9575
md"Just like `Select`, you can also give an array of pairs."

# ╔═╡ 78171613-7bc5-4637-baa1-51bbe406799a
md"""
## MultiCheckBox

This widget allows the user to select multiple elements using checkboxes.
"""

# ╔═╡ 86c44c7e-a1ba-4017-96e4-bcd21a62f058
@bind fruit_basket MultiCheckBox(["apple", "blueberry", "mango"])

# ╔═╡ 7295f8fb-dfe6-4a47-8c5b-69fac12fd433
fruit_basket

# ╔═╡ 0533b31e-6dd6-4ba7-bd18-088aaa372a1a
md"""
You can use `MultiSelect` and `MultiCheckBox` with any vector of objects, not just strings:
"""

# ╔═╡ 95037ad8-547e-4be9-b4c2-4007ab18bc6d
@bind my_functions MultiCheckBox([sin, cos, tan])

# ╔═╡ e8028331-157a-4e0e-916f-b6bc3a1d9c58
[f(π) for f in my_functions]

# ╔═╡ 71bc3973-b083-44dd-9515-bd218a812c2b
md"Just like `Select`, you can also give an array of pairs. See the Live Docs for `MultiCheckBox` for all the customization options!"

# ╔═╡ 14570075-03f2-4753-b7a8-9b15b68decea
md"## Button"

# ╔═╡ dfd4375a-1b0e-47fe-86cd-1d78a8a416b2
@bind clicked Button("Hello world")

# ╔═╡ cfb164b8-68e0-4729-8475-dab04517e784
clicked

# ╔═╡ a6ec1015-e2e4-4a0e-9dd4-a1d1246479e1
md"""
### Button as reactive trigger

In the example above, _any cell that references `clicked` will re-evaluate_ when you click the button. This means that you can a button as a **reactive trigger**, by referencing its value in another cell.
"""

# ╔═╡ db2f0150-81da-454c-a2bb-3730aa76ec8f
@bind go Button("Recompute")

# ╔═╡ 8428e964-096f-410e-93ec-bc9fae4792e0
let
	go
	
	md"I am $(rand(1:15)) years old!"
end

# ╔═╡ 2d1c9a4e-4296-4edc-a85c-258dd7b7b5b4
md"## FilePicker"

# ╔═╡ 247bd96a-a092-4d5d-824e-c54482b9c0e3
@bind important_document FilePicker()

# ╔═╡ 6f8ae93d-6d3f-44ca-a2aa-b9714985e8ed
important_document

# ╔═╡ 014249bc-7ce2-49d3-bdc8-fa35c6b33dd0
md"The file picker is useful if you want to show off your notebook on a dataset or image **uploaded by the reader**. It will work anywhere - you don't access files using their path.

The caveat is that large files might take a long time to get processed: everything needs to pass through the browser. If you are using large datasets, a better option is to use `Select` to let the reader pick a filename. You can then read the file using `Base.read(filename, type)`"

# ╔═╡ d582d684-2598-4a88-bfa1-acb087d09210
md"# Extras"

# ╔═╡ e449c1fc-9237-4ee8-9f00-ea528d10e25b
md"## Clock"

# ╔═╡ 01e83acf-76e3-414c-a40d-feedf0f35498
@bind t Clock()

# ╔═╡ ea33caca-2487-41de-af62-f3667e160bff
t

# ╔═╡ 3ab2ffef-bea7-4573-9a50-0c32058f8b0f
md"You can set the interval (`5.0` seconds), and disable the UI (`true`):"

# ╔═╡ 80128cfe-3ec1-4a3e-a570-8b1da31720ad
@bind t_slow Clock(5.0, true)

# ╔═╡ bfbf0f41-0035-4847-8544-99839c76c1da
t_slow

# ╔═╡ da2dc3d2-2f6c-4276-8f36-79efe258d54d
md"You can use a `Clock` to drive an animation! Or use it to repeat the same command at an interval: just like with `Button`, you can reference a bound (reactive) variable without actually using it!"

# ╔═╡ fb528e9c-a867-4bf6-840a-d4d371d429d7
md"## DownloadButton"

# ╔═╡ d7c18329-e403-435d-9d4d-698d15961d42
md"""
The download button is not an **input** element that you can `@bind` to, it's an **output** that you can use to get processed data from your notebook easily. The second argument is the _output filename_.
"""

# ╔═╡ 728cf19b-ae83-4dcf-a3c7-297881715ac2
DownloadButton(poem, "poem.txt")

# ╔═╡ 56837af5-749b-428e-849e-80cc2f943d6d
DownloadButton([0x01, 0x02, 0x03], "secret_data.bin")

# ╔═╡ 75b81fc8-a52c-4380-ada5-27d47b799a73
md"""
# High-level inputs
"""

# ╔═╡ c96f1464-3c80-44be-a219-9b9ef9541419
md"""
## Confirm

Normally, when you move a [`Slider`](@ref) or type in a [`TextField`](@ref), all intermediate values are sent back to `@bind`. By wrapping an input element in `confirm`, you get a button to manually **control when the value is sent**, intermediate updates are hidden from Pluto.

"""

# ╔═╡ e4924224-6509-4ae8-b4ee-6bf3f25915fc
@bind distance confirm(Slider(1:100))

# ╔═╡ 536d83b1-a5c2-463e-9bc0-1c9dd0b48f56
distance

# ╔═╡ c40d4f5e-d5e3-488f-83ff-615290152e93
md"""
`confirm` can be wrapper around any input element to create a new one, including inputs from other packages, or inputs that you have made yourself!
"""

# ╔═╡ 7fba1ec6-3ffd-4ff7-9524-cc0359ad5dd0
md"""
## Combine

This next high-level component is a bit tricky, but very powerful!

Using `combine`, you can create a single input out of multiple existing ones! In the example below, we create a new input, `wind_speed_input`. Notice that the list of wind directions is *dynamic*: if you add a new direction, a 5th slider will appear!

"""

# ╔═╡ c374fc23-2dff-4db8-a015-b11bc9ddb71a
import PlutoUI: combine

# ╔═╡ 6026b725-df21-4427-85fe-e0f3cb133d0b
function wind_speed_input(directions::Vector)
	
	return combine() do Child
		
		inputs = [
			md""" $(name): $(
				Child(name, Slider(1:100))
			)"""
			
			for name in directions
		]
		
		md"""
		#### Wind speeds
		$(inputs)
		"""
	end
end

# ╔═╡ 640f5cb1-af15-4853-b555-05911faeac5c
@bind speeds wind_speed_input(["North", "East", "South", "West"])

# ╔═╡ bf578a85-3dc4-44e2-b3bf-60d34cd54bf2
speeds

# ╔═╡ c4bcef08-645c-4c96-8f7b-0ebf97247e2f
speeds.North

# ╔═╡ edf9772b-dbd0-4b54-88ed-40b13e0e0b84
md"""
Use the Live Docs to learn more about `combine` and to see additional examples. 

> 🙋 `combine` is very useful in combination with [HypertextLiteral.jl](https://github.com/MechanicalRabbit/HypertextLiteral.jl), which you can learn using our JavaScript sample notebook. 
"""

# ╔═╡ bac9b692-877f-4cee-9406-f620f0068ed0
md"""# Loading resources

Notebooks use data from different places. For example, you use [`Base.read`](https://docs.julialang.org/en/v1/base/io-network/#:~:text=read(filename%3A%3AAbstractString%2C%20String)) to access local data (files) inside your Julia code, and [`Downloads.jl`](https://github.com/JuliaLang/Downloads.jl) for remote data (interwebs). 

`PlutoUI` helps you communicate with the person reading the notebook!
- To get **remote media** (URL) inside your **Markdown text**, use `PlutoUI.Resource`.
- To get **local media** (file) inside your **Markdown text**, use `PlutoUI.LocalResource`.

(With _media_, we mean **images**, video and audio.)

> We **strongly recommend** that you use _remote_ media inside Pluto notebooks! 
> 
> If your notebook uses local images, then those images **will not show** when someone else opens your notebook, unless they have the same images on their computer, at the exact same location. _More on this later._

"""

# ╔═╡ b763ceea-5888-4c07-a465-aba6be8b4bdd
md"""## Resource

If you just want to show **images inside Markdown**, you can use the built-in syntax (without `PlutoUI`):

```
md"Here is a _dog_: ![](https://fonsp.com/img/doggoSmall.jpg)"
```

`PlutoUI.Resource` has some extra features:
- specify **image dimensions** and spacing
- support for videos
- support for audio"""

# ╔═╡ 3641a541-1929-4571-9474-e824a1aceff0
dog_url = "https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Welsh_Springer_Spaniel.jpg/640px-Welsh_Springer_Spaniel.jpg"

# ╔═╡ fd4de803-7e59-45e8-870c-decb6b30ad3f
Resource(dog_url, :width => x * x_different)

# ╔═╡ cf0310b5-79f4-49d4-8c41-541b487b8dd0
t_rex_url = "https://upload.wikimedia.org/wikipedia/commons/transcoded/6/62/Meow.ogg/Meow.ogg.mp3"

# ╔═╡ a7bad3b9-e713-4cc6-bc66-264f63ccea56
flower_url = "https://upload.wikimedia.org/wikipedia/commons/4/41/Sunflower_Flower_Opening_Time_Lapse.ogv"

# ╔═╡ 8baa23d4-328d-4038-bdaa-ec6a20697734
md"""Hello I am a dog $(Resource(dog_url))"""

# ╔═╡ f1815fab-292f-4a3a-bab6-8d94a33b0c8a
md"""And I sound like this: $(Resource(t_rex_url))"""

# ╔═╡ cf703647-9f3a-4ffb-bdce-8602fa90569b
md"""This is my flower friend

$(Resource(flower_url, :width => 200))"""

# ╔═╡ 06930c59-44bb-49c0-8393-089db5d540bc
md"### Attributes

You can pass additional _HTML attributes_ to `Resource`, these will be added to the element. For example:"

# ╔═╡ 9aba1a7c-cf92-4fb0-9250-b94c98433061
md"""
$(Resource(dog_url, :width => 20))
$(Resource(dog_url, :width => 50))
$(Resource(dog_url, :width => 100))
$(Resource(dog_url, 
	:width => 100, 
	:style => "filter: grayscale(100%); border: 3px solid black;"))
"""

# ╔═╡ 0aa0d65e-576a-4306-ab48-f71f406d967c
Resource(flower_url, :width => 200, :autoplay => "", :loop => "")

# ╔═╡ b989ae68-8abc-4f2c-a92e-5b7b350c3af1
md"### YouTube, Vimeo, bilibili, etc.

If you use `Resource` for video, the URL has to point to a _video file_ (like `.mp4` or `.mov`). 

Popular video sites don't give you that link, instead, you can use their **embed codes**. You can find these inside the video player, by right clicking or using the menu buttons. You then use that inside an HTML block:
```
html\"\"\"
~ paste embed code here ~
\"\"\"
```

You might need to change the `width` to `100%` to make it fit."

# ╔═╡ 05d4c2f7-f4c1-4dda-9fd0-2d327a0f510d
html"""

<div style="position: relative; padding: 30% 45%;">
<iframe style="position: absolute; width: 100%; height: 100%; left: 0; top: 0;" src="https://player.bilibili.com/player.html?aid=460816113&bvid=BV1j5411g7m5&cid=345672460&page=1" frameborder="no" scrolling="no"></iframe>
</div>

"""

# ╔═╡ ab89db5e-0cb9-4667-a8fc-2a2efbf8bb40
md"## LocalResource _(not recommended)_

The examples above use `Resource` to make media from a URL available inside Markdown. To use **local files**, simply **replace `Resource` with `LocalResource`**, and use a _file path_ instead of a URL."

# ╔═╡ a016895a-9ed0-4adc-9275-210b02426bab
html"<span style='font-family: cursive; color: purple;'>I really hope that this works</span>"

# ╔═╡ 5738733b-79b3-4ad8-8ed1-4ed5d291e17e
md"""Hello I am a dog $(LocalResource("C:\\Users\\fons\\Pictures\\hannes.jpg"))"""

# ╔═╡ 259b399a-2257-4f0b-82b8-83a7feac03c6
md""" $(html"<span style='font-family: cursive; color: purple;'>OOPS</span>"), it didn't!

$(html"<br>")

Here are **two tips** for getting local images to work correctly:

1. Go to [imgur.com](https://imgur.com) and drag&drop the image to the page. Right click on the image, and select "Copy image location". You can now use the image like so: 

   ```PlutoUI.Resource("https://i.imgur.com/SAzsMMA.jpg")```


2. If your notebook is part of a git repository, place the image in the repository and use a relative path: 
   
    ```PlutoUI.LocalResource("../images/cat.jpg")```


"""

# ╔═╡ 937f8433-4daa-49ed-8a1c-2aaaff200856
md"#### Why does it have to be so difficult?

Pluto only stores _code_ in the notebook file, not images. This minimal file format is very valuable, but it means that images need to be _addressed_, not stored.

Addressing _local files_ is fragile: if someone else opens the notebook, or if you move the notebook to a different folder, that image file needs to be available at exactly the same path. This is difficult to do correctly, and if it works for you, it is hard to tell if it will work for someone else. 

Putting images online might be a hassle, but once it works, it will work everywhere! The stateless nature of URLs means that the images will work regardless of how the notebook file is accessed, while keeping a minimal file format."

# ╔═╡ 0cc6a898-c848-4b78-bb4e-bd200eed5d16
md"# PlutoUI without Pluto

Huh?

Did you know that you can run Pluto notebooks _without Pluto_? If your notebook is called `wow.jl`, then 
```sh
$ julia wow.jl
```
will run the notebook just fine. 

When you use `@bind`, your notebook can still run without Pluto! Sort of. Normally, all bound variables are assigned the value `missing` when you run it elsewhere. However, the `PlutoUI` types have all been configured to assign a more sensible default value.

For example, if your notebook contains
```julia
@bind x Slider(10:20)
```
and you run it without Pluto, then this statement simply assigns `x = 10`.
"

# ╔═╡ c4385c84-5bdc-4b78-bf4d-41f5310b579e
md"`Pluto` and `PlutoUI` work independently of each other! In fact, _you_ could write a package with fun input elements, or add `@bind`able values to existing packages."

# ╔═╡ 109a5267-45cd-43f8-99c3-39867c9466c7
md"# Appendix"

# ╔═╡ 39f12046-9167-4ca2-b34a-19629d9f0328
space = html"<br><br><br>"

# ╔═╡ 0b66ee11-92b5-4161-98f9-5a4339fad97d
space

# ╔═╡ ef697c8f-8e5b-4280-b6f1-0f3062355e28
space

# ╔═╡ 59c128e2-2b15-42bc-a29f-19f73bc29961
space

# ╔═╡ e6f09187-4e79-4f00-a250-ca26fb99a576
space

# ╔═╡ 45805cd0-6f20-4e4a-882e-db9e35fc21c8
space

# ╔═╡ 3089f522-c186-4109-aa0d-e34028501133
space

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoUI = "~0.7.48"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.3"
manifest_format = "2.0"
project_hash = "502a5e5263da26fcd619b7b7033f402a42a81ffc"

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
git-tree-sha1 = "e59ecc5a41b000fa94423a578d29290c7266fc10"
uuid = "5c2747f8-b7ea-4ff2-ba2e-563bfd36b1d4"
version = "1.4.0"

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
# ╠═7f192005-8fda-4232-82ab-d61046ffd233
# ╠═68363762-a371-4f3f-b6cb-2fd84adbeec1
# ╠═4eaeb54d-2002-4637-8917-dbae3e1c14a2
# ╠═a1789ceb-a46f-4962-ba0f-0b38c8309ce6
# ╠═0b66ee11-92b5-4161-98f9-5a4339fad97d
# ╠═4ac262d9-164b-4c95-879e-48d9616f1ae9
# ╠═dddc984d-195f-4c5b-b8a9-3c97a85bf021
# ╠═5f6cbaae-db0b-4301-ba9f-96c363f10fd4
# ╠═ccf9da3d-7217-44db-8ae6-ecb99f310099
# ╠═5ea490a1-8a47-4e45-9540-ebece44eaadb
# ╠═f4932600-86df-4ee2-80d4-0d8dbd4b5e67
# ╠═0f95494b-3ed1-4618-9215-dfdffe02730c
# ╠═2a9233be-7807-42fa-ad3a-90ce1f5cee62
# ╠═a94ac753-5e6a-4b69-8f1a-eee39a2eaf16
# ╠═3733ea37-0b3d-4a08-8bd5-3f9e86cfc192
# ╠═b27d120c-86cc-467f-a080-1273a103cb77
# ╠═f6234527-fc7d-45d4-98fb-2c3daff3726f
# ╠═586c136b-2481-49d2-af5d-bbfbb4137e04
# ╠═fd4de803-7e59-45e8-870c-decb6b30ad3f
# ╠═3975c72c-5728-4e6d-90cf-87f0163e193c
# ╠═cf429afe-061c-4dfe-ad3c-b2a82897e7ed
# ╠═2b54700e-12d4-4bdf-9dc1-905c191b8229
# ╠═5f184fb1-30fa-4447-bce3-dffbc71f6b41
# ╠═958b45d2-1d82-47b8-a45b-dab58e496e54
# ╠═43f8252c-d419-4e1b-a4b0-88b585e19f75
# ╠═a5614b6d-9abf-4d3e-a3d7-34c28c1a9cb2
# ╠═506cd3aa-9d16-496d-bcd7-07c58d0f181e
# ╠═c2fc4f6c-f365-4c32-9934-d7027e73927a
# ╠═49372104-ada2-4831-8b35-96c303fdfdc2
# ╠═623c41c7-7b8d-49f0-a49f-1c731d1c3627
# ╠═58603f09-9f6d-4474-ae2a-c3338bf7be3a
# ╠═b7fce26a-ba94-486a-ad6f-6ebbd9b98e72
# ╠═618e33f9-4dc3-4098-a07e-f69f50b189fc
# ╠═71754d60-7e64-4203-91fb-07a86fd56b60
# ╠═c62b0597-edca-47ed-85eb-5933d402206e
# ╠═82c69c22-d00a-4f9d-a6be-b624e41dbb75
# ╠═a1e472d9-6a17-4fb6-b9d5-27cf6e194894
# ╠═1e115292-f48d-406a-a8ba-b2285df488bd
# ╠═38b67bd4-e0cc-4788-a23c-2e51d2e35f48
# ╠═6714b776-3784-4e42-bb6b-618fc1103f7c
# ╠═60fde61e-7300-4f1e-8010-024d982adbf1
# ╠═ca1d952f-74f9-4363-bc6f-96dfd1da8e49
# ╠═f3d8ccc0-d250-4bd5-beb9-4c3a06ef8912
# ╠═69efc9d6-bc11-4ada-9ccc-cc811bb4663d
# ╠═2a832466-b5cc-43ca-92b1-096f78f5f30a
# ╠═364624fc-20a2-4ce4-9c18-4d00210a8543
# ╠═a28b2594-40a9-4cbc-8ae2-1b52517b9575
# ╠═78171613-7bc5-4637-baa1-51bbe406799a
# ╠═86c44c7e-a1ba-4017-96e4-bcd21a62f058
# ╠═7295f8fb-dfe6-4a47-8c5b-69fac12fd433
# ╠═0533b31e-6dd6-4ba7-bd18-088aaa372a1a
# ╠═95037ad8-547e-4be9-b4c2-4007ab18bc6d
# ╠═e8028331-157a-4e0e-916f-b6bc3a1d9c58
# ╠═71bc3973-b083-44dd-9515-bd218a812c2b
# ╠═14570075-03f2-4753-b7a8-9b15b68decea
# ╠═dfd4375a-1b0e-47fe-86cd-1d78a8a416b2
# ╠═cfb164b8-68e0-4729-8475-dab04517e784
# ╠═a6ec1015-e2e4-4a0e-9dd4-a1d1246479e1
# ╠═db2f0150-81da-454c-a2bb-3730aa76ec8f
# ╠═8428e964-096f-410e-93ec-bc9fae4792e0
# ╠═2d1c9a4e-4296-4edc-a85c-258dd7b7b5b4
# ╠═247bd96a-a092-4d5d-824e-c54482b9c0e3
# ╠═6f8ae93d-6d3f-44ca-a2aa-b9714985e8ed
# ╠═014249bc-7ce2-49d3-bdc8-fa35c6b33dd0
# ╠═ef697c8f-8e5b-4280-b6f1-0f3062355e28
# ╠═d582d684-2598-4a88-bfa1-acb087d09210
# ╠═e449c1fc-9237-4ee8-9f00-ea528d10e25b
# ╠═01e83acf-76e3-414c-a40d-feedf0f35498
# ╠═ea33caca-2487-41de-af62-f3667e160bff
# ╠═3ab2ffef-bea7-4573-9a50-0c32058f8b0f
# ╠═80128cfe-3ec1-4a3e-a570-8b1da31720ad
# ╠═bfbf0f41-0035-4847-8544-99839c76c1da
# ╠═da2dc3d2-2f6c-4276-8f36-79efe258d54d
# ╠═fb528e9c-a867-4bf6-840a-d4d371d429d7
# ╠═d7c18329-e403-435d-9d4d-698d15961d42
# ╠═728cf19b-ae83-4dcf-a3c7-297881715ac2
# ╠═56837af5-749b-428e-849e-80cc2f943d6d
# ╠═59c128e2-2b15-42bc-a29f-19f73bc29961
# ╠═75b81fc8-a52c-4380-ada5-27d47b799a73
# ╠═c96f1464-3c80-44be-a219-9b9ef9541419
# ╠═e4924224-6509-4ae8-b4ee-6bf3f25915fc
# ╠═536d83b1-a5c2-463e-9bc0-1c9dd0b48f56
# ╠═c40d4f5e-d5e3-488f-83ff-615290152e93
# ╠═7fba1ec6-3ffd-4ff7-9524-cc0359ad5dd0
# ╠═c374fc23-2dff-4db8-a015-b11bc9ddb71a
# ╠═640f5cb1-af15-4853-b555-05911faeac5c
# ╠═bf578a85-3dc4-44e2-b3bf-60d34cd54bf2
# ╠═c4bcef08-645c-4c96-8f7b-0ebf97247e2f
# ╠═6026b725-df21-4427-85fe-e0f3cb133d0b
# ╠═edf9772b-dbd0-4b54-88ed-40b13e0e0b84
# ╠═e6f09187-4e79-4f00-a250-ca26fb99a576
# ╠═bac9b692-877f-4cee-9406-f620f0068ed0
# ╠═b763ceea-5888-4c07-a465-aba6be8b4bdd
# ╠═3641a541-1929-4571-9474-e824a1aceff0
# ╠═cf0310b5-79f4-49d4-8c41-541b487b8dd0
# ╠═a7bad3b9-e713-4cc6-bc66-264f63ccea56
# ╠═8baa23d4-328d-4038-bdaa-ec6a20697734
# ╠═f1815fab-292f-4a3a-bab6-8d94a33b0c8a
# ╠═cf703647-9f3a-4ffb-bdce-8602fa90569b
# ╠═06930c59-44bb-49c0-8393-089db5d540bc
# ╠═9aba1a7c-cf92-4fb0-9250-b94c98433061
# ╠═0aa0d65e-576a-4306-ab48-f71f406d967c
# ╠═b989ae68-8abc-4f2c-a92e-5b7b350c3af1
# ╠═05d4c2f7-f4c1-4dda-9fd0-2d327a0f510d
# ╠═ab89db5e-0cb9-4667-a8fc-2a2efbf8bb40
# ╠═a016895a-9ed0-4adc-9275-210b02426bab
# ╠═5738733b-79b3-4ad8-8ed1-4ed5d291e17e
# ╠═259b399a-2257-4f0b-82b8-83a7feac03c6
# ╠═937f8433-4daa-49ed-8a1c-2aaaff200856
# ╠═45805cd0-6f20-4e4a-882e-db9e35fc21c8
# ╠═0cc6a898-c848-4b78-bb4e-bd200eed5d16
# ╠═c4385c84-5bdc-4b78-bf4d-41f5310b579e
# ╟─3089f522-c186-4109-aa0d-e34028501133
# ╟─109a5267-45cd-43f8-99c3-39867c9466c7
# ╠═39f12046-9167-4ca2-b34a-19629d9f0328
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002

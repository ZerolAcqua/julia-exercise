#
struct Language
    name::String
    title::String
    year_of_birth::Int64
    fast::Bool
end
Base.show(io::IO, l::Language) = print(
    io, l.name, ", ",
    2021 - l.year_of_birth, " years old, ",
    "has the following titles: ", l.title)
python = Language("Python", "Letargicus", 1991, false)

#
[[i * 2 for i in 1:2]' [1]
    zeros(Int64, 2, 2) [3, 4]]
[3, 4]
[1, 2, 2, 4, 3, 6]
[1 2 2 4 3 6]
my_example_vector = [1 2 3 4 5]
my_example_matrix = [1 2 3; 4 5 6; 7 8 9]
(x -> 3x).(my_example_matrix[:, 3])
mapslices(sum, my_example_matrix; dims=1)
mapslices(sum, my_example_matrix; dims=2)

#
mysum(x::Int64, y::Int64, z::Int64) = x + y + z
mysum(collect(1:3)...)

#
a = 1 + im

#
using Random: seed!
my_seed = seed!(123)
rand(my_seed, 3)
using Dates
c = Date(2001)

#
using Downloads
url = "https://raw.githubusercontent.com/JuliaDataScience/JuliaDataScience/main/Project.toml"
my_file = Downloads.download(url)

#
function myadd(a,b)
    return a+b
end
c=myadd(1.0,2.0)
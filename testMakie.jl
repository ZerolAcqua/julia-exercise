# using GLMakie 
# GLMakie.activate!()

using CairoMakie 
CairoMakie.activate!()

lines(1:10, (1:10) .^ 2; label="x²", linewidth=2, linestyle=nothing,
    figure=(; figure_padding=5, resolution=(600, 400), font="sans",
        backgroundcolor=:grey90, fontsize=16),
    axis=(; xlabel="x", title="title", xgridstyle=:dash,
        ygridstyle=:dash))
scatterlines!(1:10, (10:-1:1) .^ 2; label="Reverse(x)²")
axislegend("legend"; position=:ct)
current_figure()
using DifferentialEquations, Plots

# Define the ODE: dy/dt = y
f(y, p, t) = y
tspan = (0.0, 2.0)

# Plot general solutions
plot(title="ODE Solutions: dy/dt = y", xlabel="t", ylabel="y", legend=:topleft)
for C in [0.5, 1.0, 1.5, 2.0]
    plot!(t -> C * exp(t), tspan[1], tspan[2], label="General: C = $C", color=:blue)
end

# Define and solve IVP
y0 = 1.0
prob = ODEProblem(f, y0, tspan)
sol = solve(prob)

# Plot IVP solution
plot!(sol, label="IVP: y(0) = 1", color=:red, linewidth=2)
using Printf

function midpoint_method(f, t0, y0, h, num_steps)
  # Initialize arrays to store time and solution values
  t_values = zeros(num_steps + 1)
  y_values = zeros(num_steps + 1)

  # Set initial values
  t_values[1] = t0
  y_values[1] = y0

  # Perform the Midpoint method
  for i in 1:num_steps
    t = t_values[i]
    y = y_values[i]

    # Estimate the value at the midpoint of the interval
    y_midpoint = y + (h / 2) * f(t, y)

    # Update time and solution arrays using the midpoint estimate
    t_values[i+1] = t + h
    y_new = y + h * f(t + h / 2, y_midpoint)
    y_values[i+1] = y_new

    # Print formula in each step
    Printf.@printf("y%d = %.3e + %.3f * f(%.3f + %.3f/2, %.3e) = %.3f (%.3e)\n", i, y, h, t, h, y_midpoint, y_new, y_new)
  end

  return t_values, y_values
end


# ODE function
f(t, y) = -y + exp(t)

# Set initial conditions and parameters
t0 = 0.0
y0 = 1.0
h = 0.1
num_steps = 11

# Call the Midpoint method function
t_values, y_values = midpoint_method(f, t0, y0, h, num_steps)

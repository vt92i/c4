using Printf

function ralston_method(f, t0, y0, h, num_steps)
  # Initialize arrays to store time and solution values
  t_values = zeros(num_steps + 1)
  y_values = zeros(num_steps + 1)

  # Set initial values
  t_values[1] = t0
  y_values[1] = y0

  # Perform the Ralston's method
  for i in 1:num_steps
    t = t_values[i]
    y = y_values[i]

    # Calculate the intermediate slope k1 and use it to estimate k2
    k1 = f(t, y)
    k2 = f(t + (3 / 4) * h, y + (3 / 4) * h * k1)

    # Update time and solution arrays
    t_values[i+1] = t + h
    y_new = y + (1 / 3) * h * (k1 + 2 * k2)
    y_values[i+1] = y_new

    # Print formula in each step
    Printf.@printf("y%d = %.2e + %.3f/3 * [f(%.3f, %.2e) + 2 * f(%.3f, %.2e)] = %.3f (%.2e), k1 = %.3f, k2 = %.3f\n", i, y, h, t, y, t + (3 / 4) * h, y + (3 / 4) * h * k1, y_new, y_new, k1, k2)
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

# Call the Ralston method function
t_values, y_values = ralston_method(f, t0, y0, h, num_steps)

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

    # Calculate the slope at the current point
    k1 = f(t, y)

    # Use the midpoint method to estimate the next point
    t_mid = t + 0.5 * h
    y_mid = y + 0.5 * h * k1
    k2 = f(t_mid, y_mid)

    # Update time and solution arrays
    t_values[i+1] = t + h
    y_new = y + h * k2
    y_values[i+1] = y_new

    # Print formula in each step
    Printf.@printf("y%d = %.2e + %.2f * f(%.2f, %.2e) = %.2f (%.2e), k1 = %.2f, k2 = %.2f\n", i, y, h, t, y, y_new, y_new, k1, k2)
  end

  return t_values, y_values
end



# ODE function
f(t, y) = 80 - (45y / (2000 - 5t))

# Set initial conditions and parameters
t0 = 0.0
y0 = 5 * 17
h = 0.1
num_steps = 7

# Call the Midpoint method function
t_values, y_values = midpoint_method(f, t0, y0, h, num_steps)

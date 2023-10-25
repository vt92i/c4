using Printf

function euler_method(f, t0, y0, h, num_steps)
  # Initialize arrays to store time and solution values
  t_values = zeros(num_steps + 1)
  y_values = zeros(num_steps + 1)

  # Set initial values
  t_values[1] = t0
  y_values[1] = y0

  # Perform the Euler method
  for i in 1:num_steps
    t = t_values[i]
    y = y_values[i]

    # Update the values using the Euler method formula
    y_new = y + h * f(t, y)

    # Update time and solution arrays
    t_values[i+1] = t + h
    y_values[i+1] = y_new

    # Print formula in each step
    Printf.@printf("y%d = %.2e + %.2f * f(%.2f, %.2e) = %.2f (%.2e)\n", i, y, h, t, y, y_new, y_new)
  end

  return t_values, y_values
end

# ODE function
f(t, y) = -y * -y + 10 * t

# Set initial conditions and parameters
t0 = 0.0
y0 = 5.0
h = 0.1
num_steps = 11

# Call the Euler method function
t_values, y_values = euler_method(f, t0, y0, h, num_steps)

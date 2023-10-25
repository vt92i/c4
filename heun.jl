using Printf

function heun_method(f, t0, y0, h, num_steps)
  # Initialize arrays to store time and solution values
  t_values = zeros(num_steps + 1)
  y_values = zeros(num_steps + 1)

  # Set initial values
  t_values[1] = t0
  y_values[1] = y0

  # Perform the Heun's method
  for i in 1:num_steps
    t = t_values[i]
    y = y_values[i]

    # Predict the next value using the Heun method formula
    y_predict = y + h * f(t, y)

    # Update time and solution arrays using the average of slopes
    t_values[i+1] = t + h
    y_corrected = y + (h / 2) * (f(t, y) + f(t + h, y_predict))
    y_values[i+1] = y_corrected

    # Print formula in each step
    Printf.@printf("y%d = %.2e + %.4f/2 * [f(%.4f, %.2e) + f(%.4f, %.2e)] = %.4f | %.3f (%.2e)\n", i, y, h, t, y, t + h, y_predict, y_corrected, y_corrected, y_corrected)
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

# Call the Heun method function
t_values, y_values = heun_method(f, t0, y0, h, num_steps)

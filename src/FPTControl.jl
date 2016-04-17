module FPTControl

##################################
# Fixed Point Transformation Control toolbox #
##################################

# package code goes here
function KB(n,Λ,errors,nominal)
  out=0
  #println(2)
  for l=0:n
    out=out+(factorial(n)/(factorial(l)*factorial(n-l))*errors[l+1]*Λ^(n-l))
    println(factorial(n-l))
  end
  out=out+nominal
  return out
end

function sigmoid(x)
	s=x/(1+abs(x))
  return s
end

function G_SISO(past_input,past_response,desired)
  out=(K+past_input)*(1 + B * tanh(A * (past_response - desired))) - K
  return out
end
function G_MIMO(past_input,past_response,desired) # Inputs and Outputs are vectors
#  need control parameters  K B A
	error_norm=vecnorm(past_response - desired,2)
	# If the norm of the error is greater then the limnit compute the deformation
	# (it is not near the Fixed Point)
  if error_norm>error_limit
    e_direction=(past_response-desired)/error_norm
    B_factor= B * sigmoid(A *error_norm)
    out=(1+B_factor)*past_input +B_factor*K*e_direction
  else
    out=past_input # Almost in the Fixed Point
  end
  return out
end

end # module

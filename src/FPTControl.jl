module FPTControl

##################################
# Fixed Point Transformation Control toolbox #
##################################

# In PID case n=the order of the system +1
# In PD case n=the order of the system
# lamda is a control parameter for tuning the PID or PD
# errors is a vector where you put togather the related errors.
# example for PID n=3 (2nd order system) errors=[error_int,error,error_p], where error=qNominal - q (by defininition nominal Trajectory - Realized Trajectory)
# errror_p is the time derivative of the error
# for PD ,when n=2 (2nd order system) errors=[error,error_p]
function KB(n,lambda,errors,nominal)
  out=0
  for l=0:n-1
    out=out+(factorial(n)/(factorial(l)*factorial(n-l))*errors[l+1]*lambda^(n-l))
  end
  out=out+nominal
  return out
end
# Simple Euler integral (rectangle method)
function Integ(Integral,step,input)
    out=Integral+step*input
    return out
end

# Simple Sigmoid function, mostly you can use any Sigmoid type function, like tanh()
function sigmoid(x)
	s=x/(1+abs(x))
  return s
end
# The Original Deformation function for SISO case (note here I used tanh() for sigmoid function)
function G_SISO(past_input,past_response,desired,Kc,Bc,Ac)
  out=(Kc+past_input)*(1 + Bc * tanh(Ac * (past_response - desired))) - Kc
  return out
end

# The Original Deformation function for MIMO case
function G_MIMO(past_input,past_response,desired,error_limit,Kc,Bc,Ac) # Inputs and Outputs are vectors
#  need control parameters  K B A
	error_norm=vecnorm(past_response - desired,2)
	# If the norm of the error is greater then the limnit compute the deformation
	# (it is not near the Fixed Point)
  if error_norm>error_limit
    e_direction=(past_response-desired)/error_norm
    B_factor= Bc* sigmoid(Ac *error_norm)
    out=(1+B_factor)*past_input +B_factor*Kc*e_direction
  else
    out=past_input # Almost in the Fixed Point
  end
  return out
end


export KB,Integ,G_SISO,G_MIMO
end # module

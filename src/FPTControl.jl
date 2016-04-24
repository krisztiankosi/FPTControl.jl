module FPTControl

##################################
# Fixed Point Transformation Control toolbox #
##################################

# Global variable definitions for using Fixed Point Transformation
global Λ
global Kc
global Bc
global Ac
global Adaptive
global δt
global LONG


Λ=6
Kc=1e6
Bc=1
Ac=1e-5
Adaptive=1
δt=1e-3
LONG=Int(2e5)



# package code goes here
function KB(n,errors,nominal)
  out=0
  #println(2)
  for l=0:n
    out=out+(factorial(n)/(factorial(l)*factorial(n-l))*errors[l+1]*Λ^(n-l))
    #println(factorial(n-l))
  end
  out=out+nominal
  return out
end

function Integ(Integral,input)
    out=Integral+δt*input
    return out
end

function sigmoid(x)
	s=x/(1+abs(x))
  return s
end

function G_SISO(past_input,past_response,desired)
  out=(Kc+past_input)*(1 + Bc * tanh(Ac * (past_response - desired))) - Kc
  return out
end
function G_MIMO(past_input,past_response,desired) # Inputs and Outputs are vectors
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


export Λ,Kc,Bc,Ac,Adaptive,δt,LONG,KB,Integ,G_SISO,G_MIMO
end # module

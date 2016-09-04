# Elementwise binary functions for arrays of the same size
cuda11 = [
("add",".+","xi+yi"),
("sub",".-","xi-yi"),
("mul",".*","xi*yi"),
("div","./","xi/yi"),
("pow",".^","pow(xi,yi)"),
("max","max","(xi>yi?xi:yi)"),
("min","min","(xi<yi?xi:yi)"),
("eq",".==","xi==yi"),
("gt",".>","xi>yi"),
("ge",".>=","xi>=yi"),
("lt",".<","xi<yi"),
("le",".<=","xi<=yi"),
# "hypot",
# "rhypot",
# "atan2",
# "frexp",
# "ldexp",
# "scalbn",
# "scalbln",
# "jn",
# "yn",
# "fmod",
# "remainder",
# "mod",
# "fdim",
]

# These are used in cuda12.jl as special cases of equal sized array,array ops.
# Here we'll just define some functions that specifically do not have broadcasting.

(+){T}(x::KnetArray{T},y::KnetArray{T})=(size(x)==size(y)||throw(DimensionMismatch());(.+)(x,y))
(-){T}(x::KnetArray{T},y::KnetArray{T})=(size(x)==size(y)||throw(DimensionMismatch());(.-)(x,y))
#(*){T}(x::KnetArray{T},y::KnetArray{T})=(.*)(x,y) # This is matmul
#(/){T}(x::KnetArray{T},y::KnetArray{T})=(./)(x,y) # This is another linalg op
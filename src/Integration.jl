# TODO: combine into one function to avoid code repetition
# pass integration 'method' parameter, enum?

function left_riemann(f::Function, a::Real, b::Real, n::Int)

    delta = (b - a) / n # Calculate delta between samples
    X = a .+(0:n-1) * delta # Get range of samples
    fX = map(f, X) # Calculate f(x) for each sample in range
    return sum(fX) * delta # Sum and divide by sample width

end

function right_riemann(f::Function, a::Real, b::Real, n::Int)

    delta = (b - a) / n
    X = a .+(1:n) * delta
    fX = map(f, X)
    return sum(fX) * delta

end

function trapezoid(f::Function, a::Real, b::Real, n::Int)

    delta = (b - a) / n
    X = a .+(0:n) * delta
    fX = map(f, X)

    # must calculate mean height of left and right
    return sum(fX[2:end] + diff(fX) * 0.5) * delta

end

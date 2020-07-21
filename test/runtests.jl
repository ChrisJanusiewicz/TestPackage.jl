using TestPackage
using Test


@testset "TestPackage.jl" begin
    # integration parameters
    a = 0
    b = 1
    n = 1000

    # Error tolerance for testing
    # total_error < interval_width / (n_samples * 0.1)
    total_error = (b - a) / (n * 0.1)

    f(x) = x^2
    F(x) = x^3/3
    res = F(b) - F(a) # actual result

    lr = left_riemann(f, a, b, n)
    rr = right_riemann(f, a, b, n)
    tr = trapezoid(f, a, b, n)


    @test abs(lr - res) < total_error
    @test abs(rr - res) < total_error
    @test abs(tr - res) < total_error

end

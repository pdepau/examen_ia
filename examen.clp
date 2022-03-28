(deffacts hechos
    (robot capacidad 3)
    (pedido naranjas 2 manzanas 3 uva 1)
    (stock naranjas 10)
    (stock manzanas 10)
    (stock uva 10)
    (lineaPedido naranjas 0 manzanas 0 uva 0)
)
(defrule coger_naranjas
    (stock naranjas ?n)
    (robot capacidad ?c)
    (pedido naranjas ?p $?resto)
    (lineaPedido naranjas ?)
    (test(<= ?c ?n))
    (test(<= ?p ?n))

    =>
    (assert(lineaPedido naranjas ?p $?resto))
    (assert(stock naranjas(- ?n ?p)))

)
(defrule coger_manzanas
    (stock manzanas ?m)
    (robot capacidad ?c)
    (pedido $?pre manzanas ?p $?resto)
    (test(<= ?c ?m))
    (test(<= ?p ?m))
    =>
    (assert(lineaPedido $?pre manzanas ?p $?resto))
    (assert(stock manzanas(- ?m ?p)))

)
(defrule coger_uvas
    (stock uva ?u)
    (robot capacidad ?c)
    (pedido $?pre uva ?p )
    (test(<= ?c ?n))
    (test(<= ?p ?n))
    =>
    (assert(lineaPedido $? uva ?p))
    (assert(stock uva(- ?n ?p)))

)
(defrule meta
    (pedido naranjas ?n manzanas ?m uva ?u)
    (lineaPedido naranjas ?n2 manzanas ?m2 uva ?u2)
    (test(=  ?n2 ?n ))
    (test(=  ?m2 ?m ))
    (test(=  ?u2 ?u ))
    =>
    (halt)
)

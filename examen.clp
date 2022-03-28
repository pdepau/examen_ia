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
    (test(>= ))
)
(defrule coger_manzanas
    (stock naranjas ?m)

)
(defrule coger_uvas
    (stock naranjas ?u)

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

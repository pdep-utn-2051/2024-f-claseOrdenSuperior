module Library where
import PdePreludat

doble :: Number -> Number
doble numero = numero + numero


-- 1) Modelar un grupo que asiste a un evento, del cual nos interesa el nombre del encargado del grupo, su edad, y las edades de los acompañantes (que puede haber cualquier cantidad).
data Grupo = UnGrupo {
    encargado :: String,
    edadEncargado :: Number,
    edadesAcompaniantes :: [Number]
} deriving (Show)


-- 2) Codificar una función que dado un grupo devuelva su cantidad de integrantes.
-- Ejemplo: si tenemos el grupo de “pedro” de 20 años con 2 acompañantes de 18 y 16 años de edad, su cantidad de integrantes es 3.

grupoDePedro :: Grupo
grupoDePedro = UnGrupo { 
      encargado = "Pedro"
    , edadEncargado = 20
    , edadesAcompaniantes = [18, 16]
} 

grupoDeRocio :: Grupo
grupoDeRocio = UnGrupo {
      encargado = "Rocío"
    , edadEncargado = 29
    , edadesAcompaniantes = []
}

grupoDeJuan :: Grupo
grupoDeJuan = UnGrupo {
      encargado = "Juan"
    , edadEncargado = 38
    , edadesAcompaniantes = [37,38,39,37,37,37]
}

grupoDeAna :: Grupo
grupoDeAna = UnGrupo {
      encargado = "Ana"
    , edadEncargado = 26
    , edadesAcompaniantes = [27,28,29,27,27,27]
}

cantidadIntegrantes :: Grupo -> Number
cantidadIntegrantes grupo = 1 + length (edadesAcompaniantes grupo)

-- 3) Agregar un integrante al grupo (dada su edad)

-- como no tengo efecto, recibo el grupo y devuelvo un grupo nuevo (la copia del grupo, con la edad en la lista)
agregarIntegrante :: Number -> Grupo -> Grupo
agregarIntegrante nuevo grupo = UnGrupo { 
    encargado = encargado grupo,
    edadEncargado = edadEncargado grupo,
    edadesAcompaniantes = nuevo : edadesAcompaniantes grupo
}
-- 4) Codificar lo necesario para que, dados dos grupos, poder averiguar el nombre del encargado del grupo de mayor promedio de edad.
-- Ejemplo: si tenemos el grupo de “pedro” visto anteriormente y el grupo de “rosa” de 19 años con 1 acompañante de 21 años, cuando le pase esos dos grupos a la función debe devolver “rosa”, porque el promedio de edades del grupo de rosa es 20 mientras que el de pedro es 18.

-- QUEDA DE TAREA. DIVIDAN EN SUBTAREAS!!!

-- 5) Saber si el grupo es unitario


esUnitario :: Grupo -> Bool
esUnitario = null . edadesAcompaniantes

-- La composición (.) es una función de orden superior
-- recibe funciones como parámetro y DEVUELVE UNA FUNCIÓN

-- (.) :: (b -> c) -> (a -> b) -> (a -> c)

-- 6) Eventos: Existen eventos, a los que asisten grupos.
type Evento = [Grupo]

evento1 :: [Grupo]
evento1 = [grupoDeAna, grupoDeJuan, grupoDePedro, grupoDeRocio]

-- 7) Queremos conocer los grupos unitarios de un evento

gruposUnitarios :: [Grupo] -> [Grupo]
gruposUnitarios grupos = filter esUnitario grupos

pares :: [Number] -> [Number]
pares nros = filter even nros

-- 8) Queremos conocer los nombres de los encargados de cada grupo (dado un evento)

nombres :: [Grupo] -> [String]
nombres grupos = map encargado grupos


duplicaMuchos :: [Number] -> [Number]
duplicaMuchos nros = map doble nros



sinNegativos :: Number -> Number
sinNegativos = max 0

{-
CONSULTAS HECHAS EN CLASE:

ghci> grupoDePedro
UnGrupo {encargado = "Pedro", edad = 20, edadesAcompaniantes = [18,16]}
ghci> cantidadIntegrantes grupoDePedro 
3
ghci> cantidadIntegrantes (UnGrupo "rocío" [])

<interactive>:8:22: error: [GHC-83865]
    • Couldn't match expected type ‘Grupo’
                  with actual type ‘[Number] -> Grupo’
    • Probable cause: ‘UnGrupo’ is applied to too few arguments
      In the first argument of ‘cantidadIntegrantes’, namely
        ‘(UnGrupo "rocío" [])’
      In the expression: cantidadIntegrantes (UnGrupo "rocío" [])
      In an equation for ‘it’:
          it = cantidadIntegrantes (UnGrupo "rocío" [])

<interactive>:8:38: error: [GHC-83865]
    • Couldn't match expected type ‘Number’ with actual type ‘[a0]’
    • In the second argument of ‘UnGrupo’, namely ‘[]’
      In the first argument of ‘cantidadIntegrantes’, namely
        ‘(UnGrupo "rocío" [])’
      In the expression: cantidadIntegrantes (UnGrupo "rocío" [])
ghci> cantidadIntegrantes (UnGrupo "rocío" 29 [])
1
ghci> [1,2,3] ++ [4,5]
[1,2,3,4,5]
ghci> 4 : [5,6,7]
[4,5,6,7]
ghci> [1,2] ++ ['a','b']

<interactive>:12:11: error: [GHC-83865]
    • Couldn't match expected type ‘Number’ with actual type ‘Char’
    • In the expression: 'a'
      In the second argument of ‘(++)’, namely ‘['a', 'b']’
      In the expression: [1, 2] ++ ['a', 'b']

<interactive>:12:15: error: [GHC-83865]
    • Couldn't match expected type ‘Number’ with actual type ‘Char’
    • In the expression: 'b'
      In the second argument of ‘(++)’, namely ‘['a', 'b']’
      In the expression: [1, 2] ++ ['a', 'b']
ghci> 'a' : ['b','c']
"abc"
ghci> [1,2,3] ++ [4,5]
[1,2,3,4,5]
ghci> [1,2,3] : [4,5]

<interactive>:15:12: error: [GHC-83865]
    • Couldn't match expected type ‘[Number]’ with actual type ‘Number’
    • In the expression: 4
      In the second argument of ‘(:)’, namely ‘[4, 5]’
      In the expression: [1, 2, 3] : [4, 5]

<interactive>:15:14: error: [GHC-83865]
    • Couldn't match expected type ‘[Number]’ with actual type ‘Number’
    • In the expression: 5
      In the second argument of ‘(:)’, namely ‘[4, 5]’
      In the expression: [1, 2, 3] : [4, 5]
ghci> [1,2,3] : [[4,5]]
[[1,2,3],[4,5]]
ghci> :R
unknown command ':R'
use :? for help.
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> agregarIntegrante 23 grupoDePedro 
UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [23,18,16]}
ghci> agregarIntegrante 24 grupoDePedro 
UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [24,18,16]}
ghci> grupoDePedro 
UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [18,16]}
ghci> agregarIntegrante 23 (agregarIntegrante 24 grupoDePedro)
UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [23,24,18,16]}
ghci> :r 
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> esUnitario grupoDePedro 
False
ghci> esUnitario (UnGrupo "rocio" 29 [])
True
ghci> :t (.)
(.) :: (b -> c) -> (a -> b) -> a -> c
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> evento1
[UnGrupo {encargado = "Ana", edadEncargado = 26, edadesAcompaniantes = [27,28,29,27,27,27]},UnGrupo {encargado = "Juan", edadEncargado = 38, edadesAcompaniantes = [37,38,39,37,37,37]},UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [18,16]},UnGrupo {encargado = "Roc\237o", edadEncargado = 29, edadesAcompaniantes = []}]
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> gruposUnitarios evento1
[UnGrupo {encargado = "Roc\237o", edadEncargado = 29, edadesAcompaniantes = []}]
ghci> :R
unknown command ':R'
use :? for help.
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> pares [1,2,3,4,54,65,7,8,9,0]
[2,4,54,8,0]
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> nombres even
even     evento1
ghci> nombres evento1 
["Ana","Juan","Pedro","Roc\237o"]
ghci> evento1 
[UnGrupo {encargado = "Ana", edadEncargado = 26, edadesAcompaniantes = [27,28,29,27,27,27]},UnGrupo {encargado = "Juan", edadEncargado = 38, edadesAcompaniantes = [37,38,39,37,37,37]},UnGrupo {encargado = "Pedro", edadEncargado = 20, edadesAcompaniantes = [18,16]},UnGrupo {encargado = "Roc\237o", edadEncargado = 29, edadesAcompaniantes = []}]
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> duplicaMuchos [1,2,3,4,5]
[2,4,6,8,10]
ghci> :t any
any :: (a -> Bool) -> [a] -> Bool
ghci> any esUnitario evento1
True
ghci> any even evento1

<interactive>:42:10: error: [GHC-83865]
    • Couldn't match type ‘Grupo’ with ‘Number’
      Expected: [Number]
        Actual: [Grupo]
    • In the second argument of ‘any’, namely ‘evento1’
      In the expression: any even evento1
      In an equation for ‘it’: it = any even evento1
ghci> any even [1,2,34,5]
True
ghci> any even [1,23,33,5]
False
ghci> all even [2,4,6,8]
True
ghci> all even [1,2,4,6,8]
False
ghci> all esUnitario evento1
False
ghci> :R
unknown command ':R'
use :? for help.
ghci> :R
unknown command ':R'
use :? for help.
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
Ok, two modules loaded.
ghci> head []
*** Exception: Prelude.head: empty list
CallStack (from HasCallStack):
  error, called at libraries/base/GHC/List.hs:1644:3 in base:GHC.List
  errorEmptyList, called at libraries/base/GHC/List.hs:87:11 in base:GHC.List
  badHead, called at libraries/base/GHC/List.hs:83:28 in base:GHC.List
  head, called at src/Redefinitions.hs:900:8 in pdeprelude-0.2.0.0-2QS2SXqgaEj4I1WM1NcaHO:Redefinitions
ghci> even
<una función>
ghci> even 5
False
ghci> min
<una función>
ghci> min 5 9
5
ghci> min 5
<una función>
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
[2 of 2] Compiling Spec             ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Spec.hs, interpreted ) [Library changed]
Ok, two modules loaded.
ghci> ñaF

<interactive>:58:1: error: [GHC-88464]
    Variable not in scope: ñaF
    Suggested fix: Perhaps use ‘laF’ (imported from Library)
ghci> 
ghci> 
ghci> laF
<una función>
ghci> laF 9
5
ghci> laF 3
3
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
Ok, two modules loaded.
ghci> :R
unknown command ':R'
use :? for help.
ghci> :R
unknown command ':R'
use :? for help.
ghci> :r
[1 of 2] Compiling Library          ( /home/usuario/repos/pdep/2024-f-claseOrdenSuperior/src/Library.hs, interpreted ) [Source file changed]
Ok, two modules loaded.
ghci> laF
<una función>
ghci> laF 5
5
ghci> laF (-4)
0
ghci> laF (-1000)
0
ghci> laF 0
0
ghci> laF 56
56
ghci> filter
<una función>
ghci> filter esUnitario
<una función>
ghci> filter even
<una función>
ghci> min 56
<una función>
ghci> 
ghci> 
ghci> 
ghci> filter (>) [1,2,3,4,5,6,7,8,9]

<interactive>:81:8: error: [GHC-83865]
    • Couldn't match type ‘Number -> Bool’ with ‘Bool’
      Expected: Number -> Bool
        Actual: Number -> Number -> Bool
    • Probable cause: ‘(>)’ is applied to too few arguments
      In the first argument of ‘filter’, namely ‘(>)’
      In the expression: filter (>) [1, 2, 3, 4, ....]
      In an equation for ‘it’: it = filter (>) [1, 2, 3, ....]
ghci> filter (5>) [1,2,3,4,5,6,7,8,9]
[1,2,3,4]
ghci> filter (>5) [1,2,3,4,5,6,7,8,9]
[6,7,8,9]

-}
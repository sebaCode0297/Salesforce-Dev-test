/**
 * Created by andre on 25-03-2022.
 */
    public class Tea{
        public static void main(String[] args) {

        }

        // Creacion y uso de una Lista en Apex
        public static void ordenarTea(){
            Set<String> teaTypes = new Set<String>{'Herbal', 'Black', 'Green'};
            teaTypes.add('Black');
            teaTypes.add('Herbal');
            teaTypes.add('White');
            System.debug(teaTypes);
        }

        public static void newConjunto(){
            Set<String> nuevoConjunto = new Set<String>();
            nuevoConjunto.add('Hola');
            nuevoConjunto.add('Mundo');
            nuevoConjunto.add('Programatico');
            System.debug(nuevoConjunto);
        }

        public static void newList(){
            List<Integer> listaNumeros = new List<Integer>();
            listaNumeros.add(2);
            listaNumeros.add(3);
            listaNumeros.add(4);
            System.debug(listaNumeros);
        }
        public static void newList2(){
            List<String> listaNombres = new List<String>{'juan', 'Camila', 'Carlos'};
            System.debug(listaNombres);
        }

        public static void newMapa(){
            Map<String, Integer> mapaNombres = new Map<String, Integer>();
            mapaNombres.put('Camila', 25);
            mapaNombres.put('Carin', 23);
            mapaNombres.put('Carla', 31);
            System.debug(mapaNombres);
        }

    }
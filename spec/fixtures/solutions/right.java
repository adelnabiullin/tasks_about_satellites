package tasks.task0;

public class Polinom {
    private class Node {
        private double coef; // коэффициент узла
        private int expX; // показатель степени X
//        private int expY; // показатель степени Y
        private Node next; // указатель на следующий

        private Node() {
//            coef = expX = expY = 0;
            coef = expX = 0;
            next = null;
            tail = this;
        }
    }

    private Node head;
    private Node tail;

    // конструктор по умлч
    public Polinom() {
        head = new Node();
    }

//    // ввод с клавы
//    public void Create() {
//    System.out.println("Please, type number of elements in this polinom:");
//    Scanner sc = new Scanner(System.in);
//    int count = sc.nextInt();
//    for(int i = 0; i < count; i++) {
//
//    }
//    }

    // умножение узлов
    private void forMultiply(Node head, Node first, Node second) {
        if(first != null && second != null) {
            head.coef = first.coef * second.coef;
            head.expX = first.expX + second.expX;
            if(first.next != null) {
                head.next = new Node();
                forMultiply(head.next, first.next, second);
            }
        }
        if(second != null) {
            tail.next = new Node();
            forMultiply(tail.next, first, second.next);
        }
    }

    // умножение полиномов
    public static void multiply(Polinom result, Polinom p, Polinom q) {
        result.forMultiply(result.head, p.head ,q.head);
    }


    /*
        методы для полиномов с двумя переменными
     */

//    private void evaluateWithFixedX(Node first, double fixedX) {
//        if(first != null) {
//            head.coef = first.coef * Math.pow(fixedX, first.expX);
//            head.expY = first.expY;
//            if(first.next != null) {
//                head.next = new Node();
//                evaluateWithFixedX(first.next, fixedX);
//            }
//        }
//    }
//
//    // создать first из second при фискированном x == ourFixedX
//    public static void createFromAnotherWithFixedX(Polinom first, Polinom second, double ourFixedX) {
//        first.evaluateWithFixedX(second.head, ourFixedX);
//    }
}
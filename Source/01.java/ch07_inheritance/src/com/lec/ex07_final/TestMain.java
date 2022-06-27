package com.lec.ex07_final;

public class TestMain {
	public static void main(String[] args) {
		Animal[] animals = { new Dog(), new Rabbit() };

		for (Animal animal : animals) {
			animal.running();
			animal.running();
			animal.stop();
		} // FIRST RUNS THE 'FOR' COMMAND FOR DOG, THEN RABBIT
	}
}

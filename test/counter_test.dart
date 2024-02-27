import "package:fluttertestexample/counter.dart";
import "package:flutter_test/flutter_test.dart";

main() {
  group(
    'Counter class',
    () {
      late Counter counter;
      setUp(() => {counter = Counter()});

      // Given When Then
      test(
        'Given Counter class, when instantiated, then count = 0',
        () {
          //Arrange
          //Counter counter;
          //Act
          //counter = Counter();
          int count = counter.count;
          //Assert
          expect(count, 0);
        },
      );

      test(
        'Given Counter class is instantiated, when incrementCount is called, then count =1',
        () {
          //Counter counter = Counter();
          counter.incrementCount();
          expect(counter.count, 1);
        },
      );

      test(
        'Given counter class is instantiated, when incrementCount is called and reset, then count = 0  ',
        () {
          counter.rest();
          expect(counter.count, 0);
        },
      );

      test(
        '(Decrement) Given Counter class is instantiated, when decrementCount is called, then count remains 0 if it is already zero',
        () {
          counter.decrementCount();
          expect(counter.count, 0);
        },
      );

      test(
        'Given Counter class is instantiated, when incrementCount is called, 4 times, then count icrease is to 1, 3, 6, 10 ',
        () {
          counter.incrementCount();
          expect(counter.count, 1);

          counter.incrementCount();
          expect(counter.count, 3);

          counter.incrementCount();
          expect(counter.count, 6);

          counter.incrementCount();
          expect(counter.count, 10);
        },
      );
    },
  );
}

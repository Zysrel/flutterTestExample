import "package:fluttertestexample/counter.dart";
import "package:flutter_test/flutter_test.dart";


main(){
    group('Counter class', () { 
    late Counter counter;
    setUp(() => {
      counter = Counter()
    });

  // Given When Then
  test ('Given Counter class, when instantiated, then count = 0', (){
    //Arrange
    //Counter counter;
    //Act 
    //counter = Counter();
    int count = counter.count;
    //Assert
    expect(count, 0);
 
  });

  test('Given Counter class is instantiated, when incrementCount is called, then count =1', (){
    //Counter counter = Counter();
    counter.incrementCount();
    expect(counter.count, 1);
  });

  test('Given Counter class is instantiated, when decrementCount is called, then count =-1', () {
    //Counter counter = Counter();
    counter.decrementCount();
    expect(counter.count, -1);

  });

});

}


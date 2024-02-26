import "package:fluttertestexample/counter.dart";
import "package:flutter_test/flutter_test.dart";


main(){
  // Given When Then
  test ('Given Counter class, when instantiated, then count = 0', (){
    //Arrange
    Counter counter;
    //Act 
    counter = Counter();
    int count = counter.count;
    //Assert
    expect(count, 0);
 
  });

  test('Given Counter class is instantiated, when incrementCount is called, then count =1', (){
    Counter counter = Counter();
    counter.incrementCount();
    expect(counter.count, 1);
  });
}


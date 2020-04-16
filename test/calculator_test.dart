// import 'package:flutter/material.dart';
// import 'package:test/test.dart';
// import '../lib/logic/calculator.dart';

// void main() {
//   Color mockColor1 = Color(0xff1b5e20);
//   Color mockColor2 =  Color(0xffeab543);
//   String mockType = 'unit';

//   /* tests for getData */
//   test('test case good args for getData', () {
    
//     var result = getData(mockColor1, 'number');
//     var result2 = getData(mockColor2, 'number');

//     expect(result, '5');
//     expect(result2, '');
//   });

//   test('test undefined args for getData', () {
//     var color, type;
    
//     var result = getData(color, type);

//     expect(result, null);
//   });

//   test('wrong color for getData', () {
//   var result = getData(Color(0xffeab583), 'number');
//   var result2 = getData(Colors.red, mockType);
//     expect(result, null);
//     expect(result2, null);
//   });

//   test('test wrong type for getData', () {
    
//     var result = getData(mockColor1, 'power');
//     var result2 = getData(mockColor1, '');

//     expect(result, null);
//     expect(result2, null);
//   });

//   /* tests for getNumber */
//   test('good numbers', () {
//     var result = getNumber('1', '2', '3');
//     expect(result, 123);
//   });
//   test('empty args', () {
//     var result1 = getNumber('', '2', '3');
//     var result2 = getNumber('1', '', '3');
//     var result3 = getNumber('1', '2', '');
//     expect(result1, null);
//     expect(result2, null);
//     expect(result3, null);
//   });

//   /* tests for getResistance */
//   test('test good args', ()  {
//     var result = getResistance(123, 0.1, 'om', '+/-5%');
//     var result1 = getResistance(123, 1.0, 'Mom', '+/-5%');

//     expect(result, '12.3om+/-5%');
//     expect(result1, '123Mom+/-5%');
//   });

//   test('test wrong args for getResistance', () {
//     var result = getResistance(null, 1.0, 'Mom', '+/-5%');

//     expect(result, 'Wrong color');
//   });
// }
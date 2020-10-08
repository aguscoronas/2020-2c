!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'zero stackPrimarios Verde stackVariosVerde'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:24'!
test01EmptyStack
	
	|stackVacio finderWithEmptyStack|
	stackVacio := OOStack new.
	finderWithEmptyStack := SentenceFinderByPrefix newWith: stackVacio.
	
	
	self assert: (finderWithEmptyStack find: Verde) isEmpty.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 17:55:04'!
test02PrefixIsNotAString
	
	| finderWithPrimariosStack|
	finderWithPrimariosStack := SentenceFinderByPrefix newWith: stackPrimarios.
	
	self
		should: [ finderWithPrimariosStack find: zero.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixNotStringErrorDescription]
		! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:24'!
test03PrefixIsNotInStack
	
	| finderWithPrimariosStack |
	finderWithPrimariosStack := SentenceFinderByPrefix newWith: stackPrimarios.

	self assert: (finderWithPrimariosStack find: Verde) isEmpty.! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:24'!
test04StackOnlyContainsPrefix
	
	
	| finderWithStackVerde stackVerde|
	stackVerde := OOStack new.
	stackVerde push: Verde.

	finderWithStackVerde := SentenceFinderByPrefix newWith: stackVerde.
	
	self assert: ((finderWithStackVerde find: Verde) includes: Verde).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:24'!
test05StackContainsMultipleInstancesOfPrefix
	
	| finderWithStackVariosVerde |
	finderWithStackVariosVerde := SentenceFinderByPrefix newWith: stackVariosVerde.
	
	self assert: ((finderWithStackVariosVerde find: Verde) size = stackVariosVerde size).
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:33'!
test06FindIsCaseSensitive

	| finderWithStackVariosVerde |
	finderWithStackVariosVerde := SentenceFinderByPrefix newWith: stackVariosVerde.
	self assert: ((	finderWithStackVariosVerde find: 'verde') isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 21:33:22'!
test07StackAfterFindIsTheSame
	| finderWithPrimariosStack stackPrimariosCopy|
	"CUIDADO: destruccion de stackPrimarios"
	stackPrimariosCopy := OOStack new.
	stackPrimariosCopy push: 'Rojo'.
	stackPrimariosCopy push: 'Azul'.
	stackPrimariosCopy push: 'Amarillo'.
	
	self deny: (stackPrimariosCopy == stackPrimarios).
	
	finderWithPrimariosStack := SentenceFinderByPrefix newWith: stackPrimarios.
	
	finderWithPrimariosStack find: Verde.
	
	self assert: (stackPrimariosCopy size = finderWithPrimariosStack getStack size).
	self assert: (stackPrimariosCopy top = finderWithPrimariosStack getStack top).
	self assert: (stackPrimariosCopy pop = finderWithPrimariosStack getStack pop).
	self assert: (stackPrimariosCopy pop = finderWithPrimariosStack getStack pop).
	self assert: (stackPrimariosCopy pop = finderWithPrimariosStack getStack pop).
	self assert: (stackPrimariosCopy isEmpty = finderWithPrimariosStack getStack isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:54:07'!
test08WhitespacePrefixNotInStack
	
	| finderWithStackVariosVerde |
	finderWithStackVariosVerde := SentenceFinderByPrefix newWith: stackVariosVerde.
	
	self assert: ((finderWithStackVariosVerde find: 'Ver de') isEmpty).
	self assert: ((finderWithStackVariosVerde find: ' Verde') isEmpty).
	self deny: ((finderWithStackVariosVerde find: 'Verde ') isEmpty).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:56:49'!
test09PrefixIsOnlyAtTheStartOfString
	| finderWithStackRopaVerde stackRopaVerde|
	stackRopaVerde := OOStack new.
	stackRopaVerde push: 'Remera Verde'.
	stackRopaVerde push: 'Pantalon Verde'.
	stackRopaVerde push: 'Camisa Verde'.
	stackRopaVerde push: 'Zapatos Verdes'.
	finderWithStackRopaVerde := SentenceFinderByPrefix newWith: stackRopaVerde.
	self assert: ((	finderWithStackRopaVerde find: Verde) isEmpty).
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 18:52:24'!
test10StackContainsNonStringElements	
	|stackNonString finderWithStackNonString |
	stackNonString := OOStack new.
	stackNonString push: 1.
	stackNonString push: #('verde').
	stackNonString push: nil.
	stackNonString push: Time.
	stackNonString push: [^self fail.].
	
	finderWithStackNonString := SentenceFinderByPrefix newWith: stackNonString.
	
	self assert: ((finderWithStackNonString find: Verde) isEmpty).
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 19:00:08'!
test11StackContainsRepeatedStrings
	
	|stackRepeated finderWithStackNonString |
	stackRepeated := OOStack new.
	stackRepeated push: Verde.
	stackRepeated push: Verde.
	stackRepeated push: Verde.
	stackRepeated push: Verde.
	stackRepeated push: zero.
	
	finderWithStackNonString := SentenceFinderByPrefix newWith: stackRepeated.
	
	self assert: ((finderWithStackNonString find: Verde) size = 4).! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'A C 10/7/2020 19:03:17'!
test12StackContainsWhitspacedPrefix
	
	|stackWhitespace finderWithStackWhitespace |
	stackWhitespace := OOStack new.
	stackWhitespace push: ''.
	stackWhitespace push: ' '.
	stackWhitespace push: ' Verde'.
	stackWhitespace push: '      Verde'.
	
	finderWithStackWhitespace := SentenceFinderByPrefix newWith: stackWhitespace.
	
	self assert: ((finderWithStackWhitespace find: Verde) isEmpty).! !


!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'A C 10/7/2020 18:54:56'!
setUp
	Verde := 'Verde'.
	zero := 0.
	
	stackPrimarios := OOStack new.
	stackPrimarios push: 'Rojo'.
	stackPrimarios push: 'Azul'.
	stackPrimarios push: 'Amarillo'.
	
	stackVariosVerde := OOStack new.
	stackVariosVerde push: 'Verde'.
	stackVariosVerde push: 'Verdes'.
	stackVariosVerde push: 'Verde Manzana'.
	stackVariosVerde push: 'Verde Pradera'.
	stackVariosVerde push: 'Verde Oscuro'.
	
	! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'topLevel stackSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'A C 10/5/2020 21:29:48'!
initialize
	topLevel := Floor new.
	stackSize := 0.! !


!OOStack methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:30:11'!
isEmpty
	^topLevel isFloor.! !

!OOStack methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:31:01'!
pop
	| aValue |	 
	aValue := topLevel content. 
	stackSize := stackSize - 1.
	topLevel := topLevel previous.
	^aValue.

						
	! !

!OOStack methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:33:05'!
push: value
	topLevel := Level newAbove: topLevel
						       with: value.
	stackSize := stackSize + 1.
	
						
	! !

!OOStack methodsFor: 'public interface' stamp: 'A C 10/5/2020 18:16:46'!
size
	^stackSize.! !

!OOStack methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:31:34'!
top
	^topLevel content.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error handling' stamp: 'A C 10/5/2020 21:04:32'!
signalEmpty
	self error: self stackEmptyErrorDescription.! !


!OOStack class methodsFor: 'error descriptions' stamp: 'NR 10/1/2020 18:08:13'!
stackEmptyErrorDescription
	
	^ 'Stack is empty!!'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'testing' stamp: 'A C 10/7/2020 21:31:24'!
getStack
	^stack.! !


!SentenceFinderByPrefix methodsFor: 'public interface' stamp: 'A C 10/7/2020 20:53:56'!
find: aPrefix
	self subclassResponsibility.! !


!SentenceFinderByPrefix methodsFor: 'private' stamp: 'A C 10/7/2020 21:29:50'!
recursiveFind: aPrefix with: auxiliarStack and: stringsWithSamePrefix
	self subclassResponsibility. ! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'A C 10/7/2020 21:30:09'!
restackInto: aOOStack
	self subclassResponsibility. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 20:34:03'!
newWith: anOOStack 
	^(SentenceFinderByPrefix allSubclasses detect: [:aClass | aClass canHandle: anOOStack]) for: anOOStack.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 17:54:10'!
prefixNotStringErrorDescription
	^'Prefix is not a String'.! !


!classDefinition: #SentenceFinderWithEmptyStack category: 'Stack-Exercise'!
SentenceFinderByPrefix subclass: #SentenceFinderWithEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderWithEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 21:27:50'!
recursiveFind: aPrefix with: auxiliarStack and: stringsWithSamePrefix
	"caso base para recursion"! !

!SentenceFinderWithEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 21:27:59'!
restackInto: aOOStack
	"caso base para recursion"! !


!SentenceFinderWithEmptyStack methodsFor: 'initialization' stamp: 'A C 10/7/2020 20:40:18'!
initialize
	stack := OOStack new.! !


!SentenceFinderWithEmptyStack methodsFor: 'public interface' stamp: 'A C 10/7/2020 20:28:47'!
find: aPrefix
	
	^Bag new.
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderWithEmptyStack class' category: 'Stack-Exercise'!
SentenceFinderWithEmptyStack class
	instanceVariableNames: ''!

!SentenceFinderWithEmptyStack class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 20:36:18'!
canHandle: anOOStack
  ^anOOStack size = 0.! !

!SentenceFinderWithEmptyStack class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 20:39:48'!
for: anOOStack
	^self new.! !


!classDefinition: #SentenceFinderWithNonEmptyStack category: 'Stack-Exercise'!
SentenceFinderByPrefix subclass: #SentenceFinderWithNonEmptyStack
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderWithNonEmptyStack methodsFor: 'initialization' stamp: 'A C 10/7/2020 20:05:42'!
initializeWith: anOOStack
	stack := anOOStack.! !


!SentenceFinderWithNonEmptyStack methodsFor: 'public interface' stamp: 'A C 10/7/2020 21:21:01'!
find: aPrefix
	|auxiliarStack stringsWithSamePrefix|
	auxiliarStack := OOStack new.
	stringsWithSamePrefix := Bag new.
	(aPrefix isKindOf: String) ifFalse:[self error: SentenceFinderByPrefix prefixNotStringErrorDescription ].
	self recursiveFind: aPrefix with: auxiliarStack and: stringsWithSamePrefix.
	(SentenceFinderByPrefix newWith: auxiliarStack) restackInto: stack.
	^stringsWithSamePrefix.
	! !


!SentenceFinderWithNonEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 20:45:05'!
ifContainedPrefix: aPrefix in: aString addTo: collection
	((aString commonPrefixWith: aPrefix) == aPrefix size) ifTrue: [collection add: aPrefix]
	! !

!SentenceFinderWithNonEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 20:52:42'!
ifString: temp do: aBlock

	^ (temp isKindOf: String)			ifTrue:[aBlock value.]! !

!SentenceFinderWithNonEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 21:25:03'!
recursiveFind: aPrefix with: auxiliarStack and: stringsWithSamePrefix
	|temp|
	temp := stack pop.
	
	"si es string y contiene el prefijo lo agrego a la coleccion"
	self ifString: temp do: [self ifContainedPrefix: aPrefix in: temp addTo: stringsWithSamePrefix.].
	
	auxiliarStack push: temp.
	(SentenceFinderByPrefix newWith: stack) recursiveFind: aPrefix with: auxiliarStack and: stringsWithSamePrefix.
									! !

!SentenceFinderWithNonEmptyStack methodsFor: 'private' stamp: 'A C 10/7/2020 21:19:49'!
restackInto: stackToPush
	stackToPush push: stack pop.
	(SentenceFinderByPrefix newWith: stack) restackInto: stackToPush.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderWithNonEmptyStack class' category: 'Stack-Exercise'!
SentenceFinderWithNonEmptyStack class
	instanceVariableNames: ''!

!SentenceFinderWithNonEmptyStack class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 20:36:46'!
canHandle: anOOStack
	^anOOStack size > 0.! !

!SentenceFinderWithNonEmptyStack class methodsFor: 'as yet unclassified' stamp: 'A C 10/7/2020 20:51:10'!
for: anOOStack
	^self new initializeWith: anOOStack.! !


!classDefinition: #StackLevel category: 'Stack-Exercise'!
Object subclass: #StackLevel
	instanceVariableNames: 'previousLevel value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackLevel methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:17:59'!
content
	self subclassResponsibility.! !

!StackLevel methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:19:25'!
isFloor
	self subclassResponsibility.! !

!StackLevel methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:18:53'!
previousLevel
	self subclassResponsibility.! !


!classDefinition: #Floor category: 'Stack-Exercise'!
StackLevel subclass: #Floor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Floor methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:05:00'!
content
	OOStack signalEmpty.
	! !

!Floor methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:20:17'!
isFloor
	^true.! !

!Floor methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:05:14'!
previous
	OOStack signalEmpty.
	! !


!classDefinition: #Level category: 'Stack-Exercise'!
StackLevel subclass: #Level
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Level methodsFor: 'initialization' stamp: 'A C 10/5/2020 21:25:46'!
initializeAbove: aStackLevel with: aValue
	previousLevel := aStackLevel.
	value := aValue.! !


!Level methodsFor: 'public interface' stamp: 'A C 10/7/2020 20:14:45'!
content
	^value.! !

!Level methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:27:19'!
isFloor
	^false.! !

!Level methodsFor: 'public interface' stamp: 'A C 10/5/2020 21:27:02'!
previous
	^previousLevel.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Level class' category: 'Stack-Exercise'!
Level class
	instanceVariableNames: ''!

!Level class methodsFor: 'as yet unclassified' stamp: 'A C 10/5/2020 21:22:41'!
newAbove: previousLevel with: aValue
	^self new initializeAbove: previousLevel with: aValue.
	! !

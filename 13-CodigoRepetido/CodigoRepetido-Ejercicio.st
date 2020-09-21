!classDefinition: #CantSuspend category: #'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:52:18'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook|
	
	customerBook := CustomerBook new.
	
	self modifiyCustomerBookInLessThan: customerBook method: #addCustomerNamed: customer: 'John Lennon' timeTargetInMillisecond: 50.

	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:51:53'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook customerName |
	
	customerName := 'Paul McCartney'.
	customerBook := self createBookWithCustomer: customerName.
	

	^self modifiyCustomerBookInLessThan: customerBook method: #removeCustomerNamed: customer: customerName timeTargetInMillisecond: 100.
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:18:00'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook tryBlock catchBlock|
	customerBook := CustomerBook new.
	tryBlock := self generateTryBlockWithBook: customerBook method: #addCustomerNamed: customer: ''.
	catchBlock := self generateCatchBlockOnErrorWithBook: customerBook errorMessage: #customerCanNotBeEmptyErrorMessage.
	self try: tryBlock catch: catchBlock errorType: Error.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:01:23'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook customerName tryBlock catchBlock|
			
	customerName := 'John Lennon'.
	customerBook := self createBookWithCustomer: customerName.

	tryBlock := self generateTryBlockWithBook: customerBook method: #removeCustomerNamed: customer: 'Paul McCartney'.
	catchBlock := self generateCatchBlockWithBook: customerBook customer: customerName  method: #numberOfCustomers number: 1.
		
	self try: tryBlock catch: catchBlock errorType: NotFound.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:33:28'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook customerName numberOfCustomers typesOfCustomers|
	
	customerName := 'Paul McCartney'.
	
	customerBook := self createBookWithCustomer: customerName.

	customerBook suspendCustomerNamed: customerName.
	numberOfCustomers := #(0 1 1).
	typesOfCustomers := #(#numberOfActiveCustomers #numberOfSuspendedCustomers #numberOfCustomers).	
	
	self verifyAllNumberOfCustomers:  customerBook expected: numberOfCustomers customerType: typesOfCustomers.
	self doesBook: customerBook includeCustomer: customerName with: #assert:.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:33:28'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook customerName numberOfCustomers typesOfCustomers|
	
	customerName := 'Paul McCartney'.
	
	customerBook := self createBookWithCustomer: customerName.
	customerBook suspendCustomerNamed: customerName.
	customerBook removeCustomerNamed: customerName.
	
	numberOfCustomers := #(0 0 0).
	typesOfCustomers := #(#numberOfActiveCustomers #numberOfSuspendedCustomers #numberOfCustomers).	
	
	self verifyAllNumberOfCustomers:  customerBook expected: numberOfCustomers customerType: typesOfCustomers.
	
	self doesBook: customerBook includeCustomer: customerName with: #deny:.
	


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 18:53:05'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook customerName tryBlock catchBlock|
			
	customerName := 'John Lennon'.
	customerBook := self createBookWithCustomer: customerName.
	
	tryBlock := self generateTryBlockWithBook: customerBook method: #suspendCustomerNamed: customer: 'George Harrison'.
	catchBlock := self generateCatchBlockWithBook: customerBook customer: customerName method: #numberOfCustomers number: 1.
	
	self try: tryBlock catch: catchBlock errorType: CantSuspend.	
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 18:53:55'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook customerName tryBlock catchBlock|
			
	customerName := 'John Lennon'.
	customerBook := self createBookWithCustomer: customerName.

	customerBook suspendCustomerNamed: customerName.
	
	tryBlock := self generateTryBlockWithBook: customerBook method: #suspendCustomerNamed: customer: customerName.
	catchBlock := self generateCatchBlockWithBook: customerBook customer: customerName method: #numberOfCustomers number: 1.
	
	self try: tryBlock catch: catchBlock errorType: CantSuspend.		
! !


!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 18:51:45'!
createBookWithCustomer: customerName
	^ CustomerBook new addCustomerNamed: customerName.! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:26:08'!
doesBook: customerBook includeCustomer: customerName with: assertOrDeny
	self perform: assertOrDeny with: (customerBook includesCustomerNamed: customerName).! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:21:22'!
generateCatchBlockOnErrorWithBook: customerBook errorMessage: errorMessage
	^ [ :anError | 
			self assert: anError messageText = (CustomerBook perform: errorMessage).
			self assert: customerBook isEmpty.]! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:38:28'!
generateCatchBlockWithBook: customerBook customer: customerName method: methodName number: numberOfCustomers
	^ [ :anError | 
			self numberOfCustomersVerification: numberOfCustomers withBook: customerBook customerType: methodName.
			self doesBook: customerBook includeCustomer: customerName with: #assert:. ]! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 18:21:30'!
generateTryBlockWithBook: aCustomerBook method: methodName 
	^[aCustomerBook perform: methodName. 
			self fail.].! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 18:22:17'!
generateTryBlockWithBook: aCustomerBook method: methodName customer: customerName
	^[aCustomerBook perform: methodName with: customerName.
			self fail.].! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:39:48'!
isFasterThanTargetInMillisecond: timeTarget after: timeAfter before: timeBefore
	^(timeAfter-timeBefore)< (timeTarget * millisecond).! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:49:57'!
modifiyCustomerBookInLessThan:  customerBookToTest method: methodToTest  customer: customerName timeTargetInMillisecond: timeTarget

	| millisecondsBeforeRunning millisecondsAfterRunning |
		
	millisecondsBeforeRunning := self obtainTimeInMillisecond.
	customerBookToTest perform: methodToTest with: customerName.
	millisecondsAfterRunning := self obtainTimeInMillisecond.
	
	self assert: (self isFasterThanTargetInMillisecond: timeTarget after: millisecondsAfterRunning before: millisecondsBeforeRunning)
	
! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:38:28'!
numberOfCustomersVerification: numberOfCustomers withBook: customerBook customerType: method 
	^self assert: numberOfCustomers equals: (customerBook perform: method).! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/20/2020 18:42:12'!
obtainTimeInMillisecond
	^Time millisecondClockValue * millisecond.! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 18:37:50'!
try: try catch: catch errorType: errorType

	^ try
		on: errorType
		do:
			catch! !

!CustomerBookTest methodsFor: 'testing-util' stamp: 'Agustin Coronas 9/21/2020 19:38:28'!
verifyAllNumberOfCustomers: customerBook expected: arrayNumberOfCustomers customerType: arrayMethod
	1 to: arrayNumberOfCustomers size do: [:index | self numberOfCustomersVerification: (arrayNumberOfCustomers at: index) withBook: customerBook  customerType: (arrayMethod at: index)].! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspendedCustomers activeCustomers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:56:07'!
includesCustomerNamed: aName

	^(activeCustomers includes: aName) or: [ suspendedCustomers includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'Agustin Coronas 9/21/2020 19:56:07'!
isEmpty
	
	^activeCustomers isEmpty and: [ suspendedCustomers isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'Agustin Coronas 9/21/2020 19:56:07'!
initialize

	activeCustomers := OrderedCollection new.
	suspendedCustomers:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 20:35:57'!
addCustomerNamed: customerName

	customerName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((self isActive: customerName) or: [self isSuspended: customerName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	activeCustomers add: customerName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 19:55:56'!
numberOfActiveCustomers
	
	^activeCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 19:56:07'!
numberOfCustomers
	
	^activeCustomers size + suspendedCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 19:56:07'!
numberOfSuspendedCustomers
	
	^suspendedCustomers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 20:27:51'!
removeCustomerNamed: customerName 
 
	(self removeCustomer: customerName from: activeCustomers) ifTrue: [^customerName].
	(self removeCustomer: customerName from: suspendedCustomers) ifTrue: [^customerName]..
	

	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'Agustin Coronas 9/21/2020 20:36:47'!
suspendCustomerNamed: customerName 
	
	(self isActive: customerName) ifFalse: [^CantSuspend signal].
	
	activeCustomers remove: customerName.
	
	suspendedCustomers add: customerName
! !


!CustomerBook methodsFor: 'util' stamp: 'Agustin Coronas 9/21/2020 20:35:25'!
isActive: customerName

	^ activeCustomers includes: customerName! !

!CustomerBook methodsFor: 'util' stamp: 'Agustin Coronas 9/21/2020 20:35:56'!
isSuspended: customerName

	^ suspendedCustomers includes: customerName! !

!CustomerBook methodsFor: 'util' stamp: 'Agustin Coronas 9/21/2020 20:29:20'!
removeCustomer: customerName from: customerCollection
	customerCollection remove: customerName ifAbsent: [^false].
	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:01:49'!
customerAlreadyExistsErrorMessage

	^'customer already exists!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 9/17/2020 06:02:05'!
customerCanNotBeEmptyErrorMessage

	^'customer name cannot be empty!!'! !

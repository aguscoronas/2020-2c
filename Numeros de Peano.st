!classDefinition: #I category: #'Numeros de Peano'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros de Peano'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'next' stamp: 'Agustin Coronas 9/14/2020 21:50:21'!
next
	"^self children size = 1 ifTrue: [self children anyOne] ifFalse:[ObjectBuilder create: (self asString , 'I')  asChildOf: self collaboratorNames: '' in: 'Numeros de Peano']."
	^self createChildNamed: self name, 'I'.! !


!I class methodsFor: '+' stamp: 'Agustin Coronas 9/14/2020 21:56:31'!
+ unNro
	^unNro next.! !


!I class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 17:42:00'!
* unNro
	^unNro.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 19:24:57'!
- unNro
	^self error: 'descripcionDeErrorDeNumerosNegativosNoSoportados'.! !

!I class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 19:24:11'!
/ unNro
	^unNro = I ifTrue: [I] ifFalse: [self error: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor']. ! !


!classDefinition: #II category: #'Numeros de Peano'!
I subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros de Peano'!
II class
	instanceVariableNames: ''!

!II class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 17:44:56'!
* unNro
	^unNro + (unNro * self previous).! !

!II class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/14/2020 22:02:39'!
+ unNro
	^(unNro + self previous) next.! !

!II class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 19:21:26'!
- unNro
	^unNro = I ifTrue: [self previous] ifFalse: [self previous - unNro previous] .! !

!II class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/16/2020 19:24:24'!
/ unNro
	^self asString size < unNro asString size ifTrue: [self error: 'descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor'] ifFalse:
	[self = unNro ifTrue:[I] ifFalse: [	I + ((self - unNro) / unNro)]].! !

!II class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/14/2020 21:53:32'!
previous
	^self parent.! !


!classDefinition: #III category: #'Numeros de Peano'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIII category: #'Numeros de Peano'!
III subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIII category: #'Numeros de Peano'!
IIII subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIII category: #'Numeros de Peano'!
IIIII subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIII category: #'Numeros de Peano'!
IIIIII subclass: #IIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIII category: #'Numeros de Peano'!
IIIIIII subclass: #IIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #IIIIIIIII category: #'Numeros de Peano'!
IIIIIIII subclass: #IIIIIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!


!classDefinition: #NrosDePeanoTest category: #'Numeros de Peano'!
DenotativeObject subclass: #NrosDePeanoTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros de Peano'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NrosDePeanoTest class' category: #'Numeros de Peano'!
NrosDePeanoTest class
	instanceVariableNames: ''!

!NrosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/14/2020 20:46:21'!
test01NextDeIEsII
	Assert that: I next isEqualTo: II.! !

!NrosDePeanoTest class methodsFor: 'as yet unclassified' stamp: 'Agustin Coronas 9/14/2020 20:54:33'!
test02SumaDeUnNumeroyI
	Assert that: I + I isEqualTo: II.! !

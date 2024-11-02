 ; Implement the following match queries for the family-tree Atomspace.
 ; Get the Parents of John.
 ; Get the Mother of Pam.
 ; Get the Siblings of Pam.
 ; Get the Uncles of Tim.
 ; Get the Nephews of John.
 ; Get all Predecessors of Bob.
 ; Define family relationships
(family John)
(parent John Mary)
(parent John Robert)

(family Pam)
(parent Pam Mary)
(parent Pam Robert)

(family Tim)
(parent Tim John)
(parent Tim Linda)

(family Bob)
(parent Bob John)
(parent Bob Robert)

(sibling Mary John)
(sibling Robert John)

(sibling Pam Tim)
(sibling Tim Pam)

 ; Uncles
(uncle John Richard)
(uncle Robert James)

 ; Nephews
(nephew Tim John)
(nephew Pam John)

 ; Match queries

 ; 1. Get the Parents of John
! (match &self
    (parent John $parent)
    ($parent is_parent_of John)
)

 ; 2. Get the Mother of Pam
! (match &self
    (parent Pam $mother)
    ($mother is_mother_of Pam)
)

 ; 3. Get the Siblings of Pam
! (match &self
    (sibling Pam $sibling)
    ($sibling is_sibling_of Pam)
)

 ; 4. Get the Uncles of Tim
! (match &self
    (uncle $uncle Tim)
    ($uncle is_uncle_of Tim)
)

 ; 5. Get the Nephews of John
! (match &self
    (nephew $nephew John)
    ($nephew is_nephew_of John)
)

 ; 6. Get all Predecessors of Bob
! (match &self
    (parent $predecessor Bob)
    ($predecessor is_predecessor_of Bob)
)

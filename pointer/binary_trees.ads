generic
	type Element is private;
	
package Binary_Trees is

	type Binary_Tree is private;

	function Empty return Binary_Tree;
	function Construct( Item: Element; Left, Right: Binary_Tree ) 
		return Binary_Tree;

	Tree_Empty: exception;

	function Get_Root( T: Binary_Tree ) return Element;
		-- raises Tree_Empty exception if T is empty
	
	procedure Set_Root( T: in out Binary_Tree; Item: in Element );
		-- creates a tree (with empty subtrees) if T is empty

	function Get_Left( T: Binary_Tree ) return Binary_Tree;
		-- raises Tree_Empty exception if T is empty

	function Get_Right( T: Binary_Tree ) return Binary_Tree;
		-- raises Tree_Empty exception if T is empty

	procedure Free( T: in out Binary_Tree );

	function Is_Empty( T: Binary_Tree ) return Boolean;
		-- iff T = Empty

private

	type Node;
	type Binary_Tree is access Node;
	type Node is record
		Item: Element;
		Left, Right: Binary_Tree;
		end record;

end Binary_Trees;

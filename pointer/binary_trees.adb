with Ada.Unchecked_Deallocation;
package body Binary_Trees is

	function Empty return Binary_Tree is
	begin
		return null;
	end;

	function Construct( 
		Item: Element; 
		Left, Right: Binary_Tree
		) return Binary_Tree
	is
	begin
		return new Node'(Item, Left, Right);
	end;

	procedure Free( T: in out Binary_Tree ) is
		procedure Free_Node is new Ada.Unchecked_Deallocation(Node,Binary_Tree);
	begin
		if T /= null then
			Free(T.Left);
			Free(T.Right);
			Free_Node(T);
			T := null;   -- HF: tenyleg kell ez ide???
		end if;
	end;

	function Get_Root( T: Binary_Tree ) return Element is
	begin
		if T = null then
			raise Tree_Empty;
		else
			return T.Item;
		end if;
	end;

	procedure Set_Root( T: in out Binary_Tree; Item: in Element ) is
	begin
		if T = null then
			T := Construct(Item,null,null);
		else
			T.Item := Item;
		end if;
	end;

	function Get_Left( T: Binary_Tree ) return Binary_Tree is
	begin
		if T = null then
			raise Tree_Empty;
		else
			return T.Left;
		end if;
	end;

	function Get_Right( T: Binary_Tree ) return Binary_Tree is
	begin
		if T = null then
			raise Tree_Empty;
		else
			return T.Right;
		end if;
	end;

	function Is_Empty( T: Binary_Tree ) return Boolean is
	begin
		return T = null;
	end;

end Binary_Trees;

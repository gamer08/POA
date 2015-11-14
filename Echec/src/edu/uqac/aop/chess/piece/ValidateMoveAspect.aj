package edu.uqac.aop.chess.piece;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

import edu.uqac.aop.chess.agent.Move;


public aspect ValidateMoveAspect 
{
	/*public pointcut ValidePawn(Piece p, Move m) : target(p) && execution(boolean Pawn.isMoveLegal(Move)) && args(m);
	
	before(Piece p, Move m) : ValidePawn(p, m)
	{
		System.out.println("Ceci est un test" + m.toString());
		p._validMove = true;
	}*/
	
	Map<Pawn, Boolean> _pawns = new HashMap<Pawn,Boolean>();
	
	//interception du constructeur des pions pour pouvoir gérer les premiers coups
	public pointcut PawnCreated() : call(Pawn.new(int));
	
	Pawn around() : PawnCreated()
	{
		Pawn p = (Pawn)proceed();
		_pawns.put(p, new Boolean(false));
		
		return p;
	}
	
	// Gestion du mouvement des pions
	boolean around(Pawn pawn, Move m) : target(pawn) && execution(boolean Pawn.isMoveLegal(Move)) && args(m)
	{
		boolean value = proceed(pawn, m);
		
		// utile ppour gérer le premier coup des pions.
		if (!_pawns.get(pawn).booleanValue())
			_pawns.put(pawn,new Boolean(true));
			
		value = true;
		return value;
	}	
}

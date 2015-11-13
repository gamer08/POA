package edu.uqac.aop.chess.piece;

import edu.uqac.aop.chess.agent.Move;
import edu.uqac.aop.chess.agent.Player;

public class Queen extends Piece
{

	public Queen(int player) 
	{
		super(player);
	}

	@Override
	public String toString() 
	{
		return ((this.player == Player.WHITE) ? "D" : "d");
	}

	@Override
	public boolean isMoveLegal(Move mv)
	{
		// TODO Implement this with an aspect
		return false;
	}
}
package com.lec.split.models.expense;

import java.util.List;

import com.lec.split.EqualSplit;
import com.lec.split.Split;
import com.lec.split.models.User;

public class EqualExpense extends Expense {
	public EqualExpense(double amount, User paidBy, List<Split> splits, ExpenseMetadata expenseMetadata) {
		super(amount, paidBy, splits, expenseMetadata);
	}

	@Override
	public boolean validate() {
		for (Split split : getSplits()) {
			if (!(split instanceof EqualSplit)) {
				return false;
			}
		}

		return true;
	}
}
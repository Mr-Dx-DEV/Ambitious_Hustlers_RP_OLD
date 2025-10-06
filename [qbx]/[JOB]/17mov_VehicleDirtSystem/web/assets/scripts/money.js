window.FormatMoney = (amount) => {
	return `$${amount
		.toFixed(2)
		.replace(/\B(?=(\d{3})+(?!\d))/g, ".")
		.replace(/\.00$/, "")}`;
};

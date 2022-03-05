def stock_status_report
  @order = Order.order(:date)

  render xlsx: "stock_status_report", template: "report/stock_status_report.xlsx.axlsx"
end

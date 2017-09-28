	$.ajax({
						type : "POST",
						url : "${context}/getBestBenefitByAge.do",
						data : inputAge,
						dataType : 'json',
						success : function(ageBenefitList1) {
							$('#ageBenefitListArea_forEach_sub').empty();

							<c:forEach begin="0" end="9" varStatus="status">

							/* $('#ageBenefitListArea_forEach_sub').append('<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">${list}</div></div><div style="height: 30px; clear: both;"></div>');
							 */
							$('#ageBenefitListArea_forEach_sub')
									.append(
											'<div style="width: 100%; text-align: left; padding-left: 15%;"><div id="rank_num"	style="width: 15%; color: #F47264; font-weight: bold; display: inline-block;">${status.index+1}</div><div id="rank_name" style="color: #7b7b7b; display: inline-block;">'
													+ ageBenefitList1['${status.index}']
													+ '</div></div><div style="height: 30px; clear: both;"></div>');

							</c:forEach>

						},
						error : function(xhr, status, error) {
						}
					});
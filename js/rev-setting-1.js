				var tpj=jQuery;
				tpj.noConflict();

				tpj(document).ready(function() {

				if (tpj.fn.cssOriginal!=undefined)
					tpj.fn.css = tpj.fn.cssOriginal;

					var api = tpj('#revolution-slider').revolution(
						{
							delay:9000,
							startwidth:960,
							startheight:0,

						});

			});

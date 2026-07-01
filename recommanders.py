import pandas as pd

def recommend_funds(risk_level, sharpe_df, performance):

    recommender_df = sharpe_df.merge(
        performance[["scheme_name", "risk_grade"]],
        on="scheme_name",
        how="left"
    )

    recommendations = (
        recommender_df[
            recommender_df["risk_grade"].str.lower() == risk_level.lower()
        ]
        .sort_values("Sharpe Ratio", ascending=False)
        .head(3)
    )

    return recommendations[
        ["scheme_name", "Sharpe Ratio", "risk_grade"]
    ]
    
    
    

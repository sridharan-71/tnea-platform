interface TrendSparklineProps {
  values: (number | null)[];
}

export default function TrendSparkline({
  values,
}: TrendSparklineProps) {
  const width = 72;
  const height = 28;
  const padding = 4;

  const points = values.filter(
    (v): v is number => v !== null
  );

  if (points.length < 2) {
    return (
      <div className="flex h-7 w-[72px] items-center justify-center text-xs text-zinc-600">
        —
      </div>
    );
  }

  const min = Math.min(...points);
  const max = Math.max(...points);

  const range = max - min || 1;

  const coords = points.map((value, index) => {
    const x =
      padding +
      (index * (width - padding * 2)) /
        (points.length - 1);

    const y =
      height -
      padding -
      ((value - min) / range) *
        (height - padding * 2);

    return `${x},${y}`;
  });

  const increasing =
    points[points.length - 1] >
    points[0];

  return (
    <svg
      width={width}
      height={height}
      className="overflow-visible"
    >
      <polyline
        fill="none"
        stroke={
          increasing
            ? "#22c55e"
            : "#f43f5e"
        }
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
        points={coords.join(" ")}
      />
    </svg>
  );
}